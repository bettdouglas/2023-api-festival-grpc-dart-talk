///
//  Generated code. Do not modify.
//  source: event_service.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'event_service.pb.dart' as $0;
import 'google/protobuf/empty.pb.dart' as $1;
export 'event_service.pb.dart';

class EventServiceClient extends $grpc.Client {
  static final _$createEvent =
      $grpc.ClientMethod<$0.CreateEventRequest, $0.Event>(
          '/events.EventService/CreateEvent',
          ($0.CreateEventRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.Event.fromBuffer(value));
  static final _$getEvent = $grpc.ClientMethod<$0.GetEventRequest, $0.Event>(
      '/events.EventService/GetEvent',
      ($0.GetEventRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Event.fromBuffer(value));
  static final _$listEvents =
      $grpc.ClientMethod<$0.ListEventsRequest, $0.ListEventsResponse>(
          '/events.EventService/ListEvents',
          ($0.ListEventsRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.ListEventsResponse.fromBuffer(value));
  static final _$streamEvents =
      $grpc.ClientMethod<$0.StreamEventsRequest, $0.StreamEventsResponse>(
          '/events.EventService/StreamEvents',
          ($0.StreamEventsRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.StreamEventsResponse.fromBuffer(value));
  static final _$deleteEvent =
      $grpc.ClientMethod<$0.DeleteEventRequest, $1.Empty>(
          '/events.EventService/DeleteEvent',
          ($0.DeleteEventRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $1.Empty.fromBuffer(value));

  EventServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.Event> createEvent($0.CreateEventRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createEvent, request, options: options);
  }

  $grpc.ResponseFuture<$0.Event> getEvent($0.GetEventRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getEvent, request, options: options);
  }

  $grpc.ResponseFuture<$0.ListEventsResponse> listEvents(
      $0.ListEventsRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$listEvents, request, options: options);
  }

  $grpc.ResponseStream<$0.StreamEventsResponse> streamEvents(
      $0.StreamEventsRequest request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(
        _$streamEvents, $async.Stream.fromIterable([request]),
        options: options);
  }

  $grpc.ResponseFuture<$1.Empty> deleteEvent($0.DeleteEventRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$deleteEvent, request, options: options);
  }
}

abstract class EventServiceBase extends $grpc.Service {
  $core.String get $name => 'events.EventService';

  EventServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.CreateEventRequest, $0.Event>(
        'CreateEvent',
        createEvent_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.CreateEventRequest.fromBuffer(value),
        ($0.Event value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetEventRequest, $0.Event>(
        'GetEvent',
        getEvent_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetEventRequest.fromBuffer(value),
        ($0.Event value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ListEventsRequest, $0.ListEventsResponse>(
        'ListEvents',
        listEvents_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.ListEventsRequest.fromBuffer(value),
        ($0.ListEventsResponse value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.StreamEventsRequest, $0.StreamEventsResponse>(
            'StreamEvents',
            streamEvents_Pre,
            false,
            true,
            ($core.List<$core.int> value) =>
                $0.StreamEventsRequest.fromBuffer(value),
            ($0.StreamEventsResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.DeleteEventRequest, $1.Empty>(
        'DeleteEvent',
        deleteEvent_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.DeleteEventRequest.fromBuffer(value),
        ($1.Empty value) => value.writeToBuffer()));
  }

  $async.Future<$0.Event> createEvent_Pre($grpc.ServiceCall call,
      $async.Future<$0.CreateEventRequest> request) async {
    return createEvent(call, await request);
  }

  $async.Future<$0.Event> getEvent_Pre(
      $grpc.ServiceCall call, $async.Future<$0.GetEventRequest> request) async {
    return getEvent(call, await request);
  }

  $async.Future<$0.ListEventsResponse> listEvents_Pre($grpc.ServiceCall call,
      $async.Future<$0.ListEventsRequest> request) async {
    return listEvents(call, await request);
  }

  $async.Stream<$0.StreamEventsResponse> streamEvents_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.StreamEventsRequest> request) async* {
    yield* streamEvents(call, await request);
  }

  $async.Future<$1.Empty> deleteEvent_Pre($grpc.ServiceCall call,
      $async.Future<$0.DeleteEventRequest> request) async {
    return deleteEvent(call, await request);
  }

  $async.Future<$0.Event> createEvent(
      $grpc.ServiceCall call, $0.CreateEventRequest request);
  $async.Future<$0.Event> getEvent(
      $grpc.ServiceCall call, $0.GetEventRequest request);
  $async.Future<$0.ListEventsResponse> listEvents(
      $grpc.ServiceCall call, $0.ListEventsRequest request);
  $async.Stream<$0.StreamEventsResponse> streamEvents(
      $grpc.ServiceCall call, $0.StreamEventsRequest request);
  $async.Future<$1.Empty> deleteEvent(
      $grpc.ServiceCall call, $0.DeleteEventRequest request);
}
