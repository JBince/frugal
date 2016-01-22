package frugal

import (
	"log"
	"strconv"
	"sync"
	"time"

	"git.apache.org/thrift.git/lib/go/thrift"
	"github.com/nats-io/nats"
)

const (
	queue               = "rpc"
	maxMissedHeartbeats = 3
)

type client struct {
	tr            thrift.TTransport
	stopHeartbeat chan struct{}
	heartbeat     string
}

// FNatsServer implements FServer by using NATS as the underlying transport.
type FNatsServer struct {
	conn              *nats.Conn
	subject           string
	heartbeatSubject  string
	heartbeatDeadline time.Duration
	clients           map[string]*client
	mu                sync.Mutex
	quit              chan struct{}
	processorFactory  FProcessorFactory
	transportFactory  FTransportFactory
	protocolFactory   *FProtocolFactory
}

// NewFNatsServer creates a new FNatsServer which listens for requests on the
// given subject.
func NewFNatsServer(
	conn *nats.Conn,
	subject string,
	heartbeatDeadline time.Duration,
	processor FProcessor,
	transportFactory FTransportFactory,
	protocolFactory *FProtocolFactory) FServer {

	return NewFNatsServerFactory7(
		conn,
		subject,
		heartbeatDeadline,
		NewFProcessorFactory(processor),
		transportFactory,
		protocolFactory,
	)
}

func NewFNatsServerFactory7(
	conn *nats.Conn,
	subject string,
	heartbeatDeadline time.Duration,
	processorFactory FProcessorFactory,
	transportFactory FTransportFactory,
	protocolFactory *FProtocolFactory) FServer {

	return &FNatsServer{
		conn:              conn,
		subject:           subject,
		heartbeatSubject:  nats.NewInbox(),
		heartbeatDeadline: heartbeatDeadline,
		clients:           make(map[string]*client),
		processorFactory:  processorFactory,
		transportFactory:  transportFactory,
		protocolFactory:   protocolFactory,
		quit:              make(chan struct{}, 1),
	}
}

// Serve starts the server.
func (n *FNatsServer) Serve() error {
	sub, err := n.conn.QueueSubscribe(n.subject, queue, func(msg *nats.Msg) {
		if msg.Reply == "" {
			log.Printf("frugal: discarding invalid connect message %+v", msg)
			return
		}
		var (
			heartbeatReply = nats.NewInbox()
			listenTo       = nats.NewInbox()
			tr, err        = n.accept(listenTo, msg.Reply, heartbeatReply)
		)
		if err != nil {
			log.Println("frugal: error accepting client transport:", err)
			return
		}

		client := &client{tr: tr, stopHeartbeat: make(chan struct{}), heartbeat: heartbeatReply}
		if n.isHeartbeating() {
			n.mu.Lock()
			n.clients[heartbeatReply] = client
			n.mu.Unlock()
		}

		// Connect message consists of "[heartbeat subject] [heartbeat reply subject] [expected interval ms]"
		connectMsg := n.heartbeatSubject + " " + heartbeatReply + " " +
			strconv.FormatInt(int64(n.heartbeatDeadline.Seconds())*1000, 10)
		if err := n.conn.PublishRequest(msg.Reply, listenTo, []byte(connectMsg)); err != nil {
			log.Println("frugal: error publishing transport inbox:", err)
			tr.Close()
		} else if n.isHeartbeating() {
			go n.acceptHeartbeat(client)
		}
	})
	if err != nil {
		return err
	}

	n.conn.Flush()
	if n.isHeartbeating() {
		go n.startHeartbeat()
	}

	log.Println("frugal: server running...")
	<-n.quit
	return sub.Unsubscribe()
}

// Stop the server.
func (n *FNatsServer) Stop() error {
	close(n.quit)
	return nil
}

func (n *FNatsServer) remove(heartbeat string) {
	n.mu.Lock()
	defer n.mu.Unlock()
	client, ok := n.clients[heartbeat]
	if !ok {
		return
	}
	client.tr.Close()
	close(client.stopHeartbeat)
	delete(n.clients, heartbeat)
}

func (n *FNatsServer) startHeartbeat() {
	for {
		select {
		case <-time.After(n.heartbeatDeadline):
			n.mu.Lock()
			clients := len(n.clients)
			n.mu.Unlock()
			if clients == 0 {
				continue
			}
			if err := n.conn.Publish(n.heartbeatSubject, nil); err != nil {
				log.Println("frugal: error publishing heartbeat:", err.Error())
			}
		case <-n.quit:
			return
		}
	}
}

func (n *FNatsServer) acceptHeartbeat(client *client) {
	missed := 0
	recvHeartbeat := make(chan struct{})

	sub, err := n.conn.Subscribe(client.heartbeat, func(msg *nats.Msg) {
		recvHeartbeat <- struct{}{}
	})
	if err != nil {
		log.Println("frugal: error subscribing to heartbeat", client.heartbeat)
		return
	}
	defer sub.Unsubscribe()

	for {
		select {
		case <-time.After(n.heartbeatDeadline):
			missed++
			if missed >= maxMissedHeartbeats {
				log.Println("frugal: client heartbeat expired")
				n.remove(client.heartbeat)
				return
			}
		case <-recvHeartbeat:
			missed = 0
		case <-client.stopHeartbeat:
			return
		case <-n.quit:
			return
		}
	}
}

func (n *FNatsServer) accept(listenTo, replyTo, heartbeat string) (FTransport, error) {
	client := newNatsServiceTTransportServer(n.conn, listenTo, replyTo)
	transport := n.transportFactory.GetTransport(client)
	if err := transport.Open(); err != nil {
		return nil, err
	}

	processor := n.processorFactory.GetProcessor(transport)
	protocol := n.protocolFactory.GetProtocol(transport)
	transport.SetRegistry(NewServerRegistry(processor, n.protocolFactory, protocol))

	// Cleanup heartbeat when client disconnects.
	go func() {
		select {
		case <-n.quit:
			client.Close()
		case <-transport.Closed():
		}

		n.remove(heartbeat)
	}()

	return transport, nil
}

func (n *FNatsServer) isHeartbeating() bool {
	return n.heartbeatDeadline > 0
}
