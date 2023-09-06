// Autogenerated by Frugal Compiler (3.16.26)
// DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING



// ignore_for_file: unused_import
// ignore_for_file: unused_field
import 'dart:async';
import 'dart:typed_data' show Uint8List;

import 'package:thrift/thrift.dart' as thrift;
import 'package:frugal/frugal.dart' as frugal;

import 'package:variety/variety.dart' as t_variety;


const String delimiter = '.';

EventsPublisher eventsPublisherFactory(frugal.FScopeProvider provider, {List<frugal.Middleware>? middleware}) =>
    EventsPublisher(provider, middleware);

/// This docstring gets added to the generated code because it has
/// the @ sign. Prefix specifies topic prefix tokens, which can be static or
/// variable.
class EventsPublisher {
  frugal.FPublisherTransport transport;
  frugal.FProtocolFactory protocolFactory;
  Map<String, frugal.FMethod>? _methods = {};
  EventsPublisher(frugal.FScopeProvider provider, [List<frugal.Middleware>? middleware]) {
    transport = provider.publisherTransportFactory.getTransport();
    protocolFactory = provider.protocolFactory;
    var combined = middleware ?? [];
    combined.addAll(provider.middleware);
    this._methods = {};
    this._methods?['EventCreated'] = frugal.FMethod(this._publishEventCreated, 'Events', 'publishEventCreated', combined);
    this._methods?['SomeInt'] = frugal.FMethod(this._publishSomeInt, 'Events', 'publishSomeInt', combined);
    this._methods?['SomeStr'] = frugal.FMethod(this._publishSomeStr, 'Events', 'publishSomeStr', combined);
    this._methods?['SomeList'] = frugal.FMethod(this._publishSomeList, 'Events', 'publishSomeList', combined);
  }

  Future open() {
    return transport.open();
  }

  Future close() {
    return transport.close();
  }

  /// This is a docstring.
  Future publishEventCreated(frugal.FContext ctx, String user, t_variety.Event req) {
    return this._methods?['EventCreated']([ctx, user, req]);
  }

  Future _publishEventCreated(frugal.FContext ctx, String user, t_variety.Event req) async {
    ctx.addRequestHeader('_topic_user', user);
    var op = 'EventCreated';
    var prefix = 'foo.$user.';
    var topic = '${prefix}Events$delimiter$op';
    var memoryBuffer = frugal.TMemoryOutputBuffer(transport.publishSizeLimit);
    var oprot = protocolFactory.getProtocol(memoryBuffer);
    var msg = thrift.TMessage(op, thrift.TMessageType.CALL, 0);
    oprot.writeRequestHeader(ctx);
    oprot.writeMessageBegin(msg);
    req!.write(oprot);
    oprot.writeMessageEnd();
    // sync in this version but async in v2. Mitigate breaking changes by always awaiting.
    // ignore: await_only_futures
    await transport.publish(topic, memoryBuffer.writeBytes);
  }


  Future publishSomeInt(frugal.FContext ctx, String user, int req) {
    return this._methods?['SomeInt']([ctx, user, req]);
  }

  Future _publishSomeInt(frugal.FContext ctx, String user, int req) async {
    ctx.addRequestHeader('_topic_user', user);
    var op = 'SomeInt';
    var prefix = 'foo.$user.';
    var topic = '${prefix}Events$delimiter$op';
    var memoryBuffer = frugal.TMemoryOutputBuffer(transport.publishSizeLimit);
    var oprot = protocolFactory.getProtocol(memoryBuffer);
    var msg = thrift.TMessage(op, thrift.TMessageType.CALL, 0);
    oprot.writeRequestHeader(ctx);
    oprot.writeMessageBegin(msg);
    oprot.writeI64(req);
    oprot.writeMessageEnd();
    // sync in this version but async in v2. Mitigate breaking changes by always awaiting.
    // ignore: await_only_futures
    await transport.publish(topic, memoryBuffer.writeBytes);
  }


  Future publishSomeStr(frugal.FContext ctx, String user, String req) {
    return this._methods?['SomeStr']([ctx, user, req]);
  }

  Future _publishSomeStr(frugal.FContext ctx, String user, String req) async {
    ctx.addRequestHeader('_topic_user', user);
    var op = 'SomeStr';
    var prefix = 'foo.$user.';
    var topic = '${prefix}Events$delimiter$op';
    var memoryBuffer = frugal.TMemoryOutputBuffer(transport.publishSizeLimit);
    var oprot = protocolFactory.getProtocol(memoryBuffer);
    var msg = thrift.TMessage(op, thrift.TMessageType.CALL, 0);
    oprot.writeRequestHeader(ctx);
    oprot.writeMessageBegin(msg);
    oprot.writeString(req);
    oprot.writeMessageEnd();
    // sync in this version but async in v2. Mitigate breaking changes by always awaiting.
    // ignore: await_only_futures
    await transport.publish(topic, memoryBuffer.writeBytes);
  }


  Future publishSomeList(frugal.FContext ctx, String user, List<Map<int, t_variety.Event>> req) {
    return this._methods?['SomeList']([ctx, user, req]);
  }

  Future _publishSomeList(frugal.FContext ctx, String user, List<Map<int, t_variety.Event>> req) async {
    ctx.addRequestHeader('_topic_user', user);
    var op = 'SomeList';
    var prefix = 'foo.$user.';
    var topic = '${prefix}Events$delimiter$op';
    var memoryBuffer = frugal.TMemoryOutputBuffer(transport.publishSizeLimit);
    var oprot = protocolFactory.getProtocol(memoryBuffer);
    var msg = thrift.TMessage(op, thrift.TMessageType.CALL, 0);
    oprot.writeRequestHeader(ctx);
    oprot.writeMessageBegin(msg);
    oprot.writeListBegin(thrift.TList(thrift.TType.MAP, req.length));
    for(var elem74 in req) {
      oprot.writeMapBegin(thrift.TMap(thrift.TType.I64, thrift.TType.STRUCT, elem74.length));
      for(var elem75 in elem74.keys) {
        oprot.writeI64(elem75);
        elem74[elem75].write(oprot);
      }
      oprot.writeMapEnd();
    }
    oprot.writeListEnd();
    oprot.writeMessageEnd();
    // sync in this version but async in v2. Mitigate breaking changes by always awaiting.
    // ignore: await_only_futures
    await transport.publish(topic, memoryBuffer.writeBytes);
  }
}


EventsSubscriber eventsSubscriberFactory(frugal.FScopeProvider provider, {List<frugal.Middleware>? middleware}) =>
    EventsSubscriber(provider, middleware);

/// This docstring gets added to the generated code because it has
/// the @ sign. Prefix specifies topic prefix tokens, which can be static or
/// variable.
class EventsSubscriber {
  final frugal.FScopeProvider provider;
  final List<frugal.Middleware>? _middleware;

  EventsSubscriber(this.provider, [List<frugal.Middleware>? middleware])
      : this._middleware = middleware ?? [] {
    this._middleware?.addAll(provider.middleware);
}

  /// This is a docstring.
  Future<frugal.FSubscription> subscribeEventCreated(String user, dynamic onEvent(frugal.FContext ctx, t_variety.Event req)) async {
    var op = 'EventCreated';
    var prefix = 'foo.$user.';
    var topic = '${prefix}Events$delimiter$op';
    var transport = provider.subscriberTransportFactory.getTransport();
    await transport.subscribe(topic, _recvEventCreated(op, provider.protocolFactory, onEvent));
    return frugal.FSubscription(topic, transport);
  }

  frugal.FAsyncCallback _recvEventCreated(String op, frugal.FProtocolFactory protocolFactory, dynamic onEvent(frugal.FContext ctx, t_variety.Event req)) {
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
      t_variety.Event req = t_variety.Event();
      req.read(iprot);
      iprot.readMessageEnd();
      method([ctx, req]);
    }
    return callbackEventCreated;
  }


  Future<frugal.FSubscription> subscribeSomeInt(String user, dynamic oni64(frugal.FContext ctx, int req)) async {
    var op = 'SomeInt';
    var prefix = 'foo.$user.';
    var topic = '${prefix}Events$delimiter$op';
    var transport = provider.subscriberTransportFactory.getTransport();
    await transport.subscribe(topic, _recvSomeInt(op, provider.protocolFactory, oni64));
    return frugal.FSubscription(topic, transport);
  }

  frugal.FAsyncCallback _recvSomeInt(String op, frugal.FProtocolFactory protocolFactory, dynamic oni64(frugal.FContext ctx, int req)) {
    frugal.FMethod method = frugal.FMethod(oni64, 'Events', 'subscribei64', this._middleware);
    callbackSomeInt(thrift.TTransport transport) {
      var iprot = protocolFactory.getProtocol(transport);
      var ctx = iprot.readRequestHeader();
      var tMsg = iprot.readMessageBegin();
      if (tMsg.name != op) {
        thrift.TProtocolUtil.skip(iprot, thrift.TType.STRUCT);
        iprot.readMessageEnd();
        throw thrift.TApplicationError(
        frugal.FrugalTApplicationErrorType.UNKNOWN_METHOD, tMsg.name);
      }
      int req = iprot.readI64();
      iprot.readMessageEnd();
      method([ctx, req]);
    }
    return callbackSomeInt;
  }


  Future<frugal.FSubscription> subscribeSomeStr(String user, dynamic onstring(frugal.FContext ctx, String req)) async {
    var op = 'SomeStr';
    var prefix = 'foo.$user.';
    var topic = '${prefix}Events$delimiter$op';
    var transport = provider.subscriberTransportFactory.getTransport();
    await transport.subscribe(topic, _recvSomeStr(op, provider.protocolFactory, onstring));
    return frugal.FSubscription(topic, transport);
  }

  frugal.FAsyncCallback _recvSomeStr(String op, frugal.FProtocolFactory protocolFactory, dynamic onstring(frugal.FContext ctx, String req)) {
    frugal.FMethod method = frugal.FMethod(onstring, 'Events', 'subscribestring', this._middleware);
    callbackSomeStr(thrift.TTransport transport) {
      var iprot = protocolFactory.getProtocol(transport);
      var ctx = iprot.readRequestHeader();
      var tMsg = iprot.readMessageBegin();
      if (tMsg.name != op) {
        thrift.TProtocolUtil.skip(iprot, thrift.TType.STRUCT);
        iprot.readMessageEnd();
        throw thrift.TApplicationError(
        frugal.FrugalTApplicationErrorType.UNKNOWN_METHOD, tMsg.name);
      }
      String req = iprot.readString();
      iprot.readMessageEnd();
      method([ctx, req]);
    }
    return callbackSomeStr;
  }


  Future<frugal.FSubscription> subscribeSomeList(String user, dynamic onlist(frugal.FContext ctx, List<Map<int, t_variety.Event>> req)) async {
    var op = 'SomeList';
    var prefix = 'foo.$user.';
    var topic = '${prefix}Events$delimiter$op';
    var transport = provider.subscriberTransportFactory.getTransport();
    await transport.subscribe(topic, _recvSomeList(op, provider.protocolFactory, onlist));
    return frugal.FSubscription(topic, transport);
  }

  frugal.FAsyncCallback _recvSomeList(String op, frugal.FProtocolFactory protocolFactory, dynamic onlist(frugal.FContext ctx, List<Map<int, t_variety.Event>> req)) {
    frugal.FMethod method = frugal.FMethod(onlist, 'Events', 'subscribelist', this._middleware);
    callbackSomeList(thrift.TTransport transport) {
      var iprot = protocolFactory.getProtocol(transport);
      var ctx = iprot.readRequestHeader();
      var tMsg = iprot.readMessageBegin();
      if (tMsg.name != op) {
        thrift.TProtocolUtil.skip(iprot, thrift.TType.STRUCT);
        iprot.readMessageEnd();
        throw thrift.TApplicationError(
        frugal.FrugalTApplicationErrorType.UNKNOWN_METHOD, tMsg.name);
      }
      thrift.TList elem76 = iprot.readListBegin();
      List<Map<int, t_variety.Event>> req = <Map<int, t_variety.Event>>[];
      for(int elem82 = 0; elem82 < elem76.length; ++elem82) {
        thrift.TMap elem78 = iprot.readMapBegin();
        Map<int, t_variety.Event> elem77 = <int, t_variety.Event>{};
        for(int elem80 = 0; elem80 < elem78.length; ++elem80) {
          int elem81 = iprot.readI64();
          t_variety.Event elem79 = t_variety.Event();
          elem79.read(iprot);
          elem77[elem81] = elem79;
        }
        iprot.readMapEnd();
        req.add(elem77);
      }
      iprot.readListEnd();
      iprot.readMessageEnd();
      method([ctx, req]);
    }
    return callbackSomeList;
  }
}

