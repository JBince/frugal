package com.workiva.frugal.server;

import com.workiva.frugal.processor.FProcessor;
import com.workiva.frugal.processor.FProcessorFactory;
import com.workiva.frugal.protocol.FProtocol;
import com.workiva.frugal.protocol.FProtocolFactory;
import com.workiva.frugal.protocol.FServerRegistry;
import com.workiva.frugal.transport.FTransport;
import com.workiva.frugal.transport.FTransportFactory;
import org.apache.thrift.TException;
import org.apache.thrift.transport.TServerTransport;
import org.apache.thrift.transport.TTransport;
import org.apache.thrift.transport.TTransportException;

import java.util.logging.Logger;

/**
 * Simple multi-threaded server.
 */
public class FSimpleServer implements FServer {

    private FProcessorFactory fProcessorFactory;
    private TServerTransport tServerTransport;
    private FTransportFactory fTransportFactory;
    private FProtocolFactory fProtocolFactory;
    private volatile boolean stopped;

    private static Logger LOGGER = Logger.getLogger(FSimpleServer.class.getName());

    public FSimpleServer(FProcessorFactory fProcessorFactory, TServerTransport fServerTransport,
                         FTransportFactory fTransportFactory, FProtocolFactory fProtocolFactory) {
        this.fProcessorFactory = fProcessorFactory;
        this.tServerTransport = fServerTransport;
        this.fTransportFactory = fTransportFactory;
        this.fProtocolFactory = fProtocolFactory;
    }

    public void acceptLoop() throws TException {
        while (!stopped) {
            TTransport client;
            try {
                client = tServerTransport.accept();
            } catch (TException e) {
                if (stopped) {
                    return;
                }
                throw e;
            }
            if (client != null) {
                ProcessorThread processorThread = new ProcessorThread(client);
                processorThread.run();
            }
        }
    }

    private class ProcessorThread extends Thread {
        TTransport client;

        ProcessorThread(TTransport client) {
            this.client = client;
            setName("processor");
        }

        public void run()  {
            try {
                accept(client);
            } catch (TTransportException ttx) {
                // Client died, just move on
            } catch (TException tx) {
                if (!stopped) {
                    LOGGER.warning("frugal: Thrift error occurred during processing of message. " + tx.getMessage());
                }
            } catch (Exception x) {
                if (!stopped) {
                    LOGGER.warning("frugal: Error occurred during processing of message. " + x.getMessage());
                }
            }
        }
    }

    protected void accept(TTransport client) throws TException {
        FProcessor processor = fProcessorFactory.getProcessor(client);
        FTransport transport = fTransportFactory.getTransport(client);
        FProtocol protocol = fProtocolFactory.getProtocol(transport);
        transport.setRegistry(new FServerRegistry(processor, fProtocolFactory, protocol));
        transport.open();
    }

    public void serve() throws TException {
        acceptLoop();
    }

    public void stop() throws TException{
        stopped = true;
        tServerTransport.interrupt();
    }
}
