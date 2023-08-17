///
//  Generated code. Do not modify.
//  source: echo_service.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'echo_service.pb.dart' as $0;
export 'echo_service.pb.dart';

class EchoClient extends $grpc.Client {
  static final _$echo = $grpc.ClientMethod<$0.EchoRequest, $0.EchoResponse>(
      '/echo.Echo/Echo',
      ($0.EchoRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.EchoResponse.fromBuffer(value));
  static final _$echoStream =
      $grpc.ClientMethod<$0.EchoRequest, $0.EchoStreamResponse>(
          '/echo.Echo/EchoStream',
          ($0.EchoRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.EchoStreamResponse.fromBuffer(value));

  EchoClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.EchoResponse> echo($0.EchoRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$echo, request, options: options);
  }

  $grpc.ResponseStream<$0.EchoStreamResponse> echoStream($0.EchoRequest request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(
        _$echoStream, $async.Stream.fromIterable([request]),
        options: options);
  }
}

abstract class EchoServiceBase extends $grpc.Service {
  $core.String get $name => 'echo.Echo';

  EchoServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.EchoRequest, $0.EchoResponse>(
        'Echo',
        echo_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.EchoRequest.fromBuffer(value),
        ($0.EchoResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.EchoRequest, $0.EchoStreamResponse>(
        'EchoStream',
        echoStream_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $0.EchoRequest.fromBuffer(value),
        ($0.EchoStreamResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.EchoResponse> echo_Pre(
      $grpc.ServiceCall call, $async.Future<$0.EchoRequest> request) async {
    return echo(call, await request);
  }

  $async.Stream<$0.EchoStreamResponse> echoStream_Pre(
      $grpc.ServiceCall call, $async.Future<$0.EchoRequest> request) async* {
    yield* echoStream(call, await request);
  }

  $async.Future<$0.EchoResponse> echo(
      $grpc.ServiceCall call, $0.EchoRequest request);
  $async.Stream<$0.EchoStreamResponse> echoStream(
      $grpc.ServiceCall call, $0.EchoRequest request);
}
