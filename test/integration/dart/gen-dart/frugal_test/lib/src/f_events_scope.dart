// Autogenerated by Frugal Compiler (3.16.8)
// DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING



// ignore_for_file: unused_import
// ignore_for_file: unused_field
import 'dart:async';
import 'dart:typed_data' show Uint8List;

import 'package:thrift/thrift.dart' as thrift;
import 'package:frugal/frugal.dart' as frugal;

import 'package:frugal_test/frugal_test.dart' as t_frugal_test;


const String delimiter = '.';

EventsPublisher eventsPublisherFactory(frugal.FScopeProvider provider, {List<frugal.Middleware> middleware}) =>
    EventsPublisher(provider, middleware);

class EventsPublisher {
  frugal.FPublisherTransport transport;
  frugal.FProtocolFactory protocolFactory;
  Map<String, frugal.FMethod> _methods;
  EventsPublisher(frugal.FScopeProvider provider, [List<frugal.Middleware> middleware]) {
    transport = provider.publisherTransportFactory.getTransport();
    protocolFactory = provider.protocolFactory;
    var combined = middleware ?? [];
    combined.addAll(provider.middleware);
    this._methods = {};
    this._methods['EventCreated'] = frugal.FMethod(this._publishEventCreated, 'Events', 'publishEventCreated', combined);
  }

  Future open() {
    return transport.open();
  }

  Future close() {
    return transport.close();
  }

  Future publishEventCreated(frugal.FContext ctx, String preamble, String ramble, String role, String RID, t_frugal_test.Event req) {
    return this._methods['EventCreated']([ctx, preamble, ramble, role, RID, req]);
  }

  Future _publishEventCreated(frugal.FContext ctx, String preamble, String ramble, String role, String RID, t_frugal_test.Event req) async {
    ctx.addRequestHeader('_topic_preamble', preamble);
    ctx.addRequestHeader('_topic_ramble', ramble);
    ctx.addRequestHeader('_topic_role', role);
    ctx.addRequestHeader('_topic_RID', RID);
    var op = 'EventCreated';
    var prefix = '$preamble.$ramble.$role.$RID.';
    var topic = '${prefix}Events$delimiter$op';
    var memoryBuffer = frugal.TMemoryOutputBuffer(transport.publishSizeLimit);
    var oprot = protocolFactory.getProtocol(memoryBuffer);
    var msg = thrift.TMessage(op, thrift.TMessageType.CALL, 0);
    oprot.writeRequestHeader(ctx);
    oprot.writeMessageBegin(msg);
    req.write(oprot);
    oprot.writeMessageEnd();
    // sync in this version but async in v2. Mitigate breaking changes by always awaiting.
    // ignore: await_only_futures
    await transport.publish(topic, memoryBuffer.writeBytes);
  }
}


EventsSubscriber eventsSubscriberFactory(frugal.FScopeProvider provider, {List<frugal.Middleware> middleware}) =>
    EventsSubscriber(provider, middleware);

class EventsSubscriber {
  final frugal.FScopeProvider provider;
  final List<frugal.Middleware> _middleware;

  EventsSubscriber(this.provider, [List<frugal.Middleware> middleware])
      : this._middleware = middleware ?? [] {
    this._middleware.addAll(provider.middleware);
}

  Future<frugal.FSubscription> subscribeEventCreated(String preamble, String ramble, String role, String RID, dynamic onEvent(frugal.FContext ctx, t_frugal_test.Event req)) async {
    var op = 'EventCreated';
    var prefix = '$preamble.$ramble.$role.$RID.';
    var topic = '${prefix}Events$delimiter$op';
    var transport = provider.subscriberTransportFactory.getTransport();
    await transport.subscribe(topic, _recvEventCreated(op, provider.protocolFactory, onEvent));
    return frugal.FSubscription(topic, transport);
  }

  frugal.FAsyncCallback _recvEventCreated(String op, frugal.FProtocolFactory protocolFactory, dynamic onEvent(frugal.FContext ctx, t_frugal_test.Event req)) {
    frugal.FMethod method = frugal.FMethod(onEvent, 'Events', 'subscribeEvent', this._middleware);
    callbackEventCreated(thrift.TTransport transport) {
      var iprot = protocolFactory.getProtocol(transport);
      var ctx = iprot.readRequestHeader();
      var tMsg = iprot.readMessageBegin();
      if (tMsg.name != op) {
        thrift.TProtocolUtil.skip(iprot, thrift.TType.STRUCT);
        iprot.readMessageEnd();
        throw thrift.TApplicationError(
        frugal.FrugalTApplicationErrorType.UNKNOWN_METHOD, tMsg.name);
      }
      t_frugal_test.Event req = t_frugal_test.Event();
      req.read(iprot);
      iprot.readMessageEnd();
      method([ctx, req]);
    }
    return callbackEventCreated;
  }
}

