///
//  Generated code. Do not modify.
//  source: user_service.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'user_service.pb.dart' as $0;
import 'google/protobuf/empty.pb.dart' as $1;
export 'user_service.pb.dart';

class UserServiceClient extends $grpc.Client {
  static final _$listUsers =
      $grpc.ClientMethod<$0.ListUsersRequest, $0.ListUsersResponse>(
          '/events.UserService/ListUsers',
          ($0.ListUsersRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.ListUsersResponse.fromBuffer(value));
  static final _$getUser = $grpc.ClientMethod<$0.GetUserRequest, $0.User>(
      '/events.UserService/GetUser',
      ($0.GetUserRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.User.fromBuffer(value));
  static final _$createUser = $grpc.ClientMethod<$0.CreateUserRequest, $0.User>(
      '/events.UserService/CreateUser',
      ($0.CreateUserRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.User.fromBuffer(value));
  static final _$updateUser = $grpc.ClientMethod<$0.UpdateUserRequest, $0.User>(
      '/events.UserService/UpdateUser',
      ($0.UpdateUserRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.User.fromBuffer(value));
  static final _$deleteUser =
      $grpc.ClientMethod<$0.DeleteUserRequest, $1.Empty>(
          '/events.UserService/DeleteUser',
          ($0.DeleteUserRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $1.Empty.fromBuffer(value));
  static final _$streamUser =
      $grpc.ClientMethod<$0.StreamUserRequest, $0.StreamUserResponse>(
          '/events.UserService/StreamUser',
          ($0.StreamUserRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.StreamUserResponse.fromBuffer(value));
  static final _$streamUsers =
      $grpc.ClientMethod<$0.StreamUsersRequest, $0.StreamUsersResponse>(
          '/events.UserService/StreamUsers',
          ($0.StreamUsersRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.StreamUsersResponse.fromBuffer(value));

  UserServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.ListUsersResponse> listUsers(
      $0.ListUsersRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$listUsers, request, options: options);
  }

  $grpc.ResponseFuture<$0.User> getUser($0.GetUserRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getUser, request, options: options);
  }

  $grpc.ResponseFuture<$0.User> createUser($0.CreateUserRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createUser, request, options: options);
  }

  $grpc.ResponseFuture<$0.User> updateUser($0.UpdateUserRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updateUser, request, options: options);
  }

  $grpc.ResponseFuture<$1.Empty> deleteUser($0.DeleteUserRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$deleteUser, request, options: options);
  }

  $grpc.ResponseStream<$0.StreamUserResponse> streamUser(
      $0.StreamUserRequest request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(
        _$streamUser, $async.Stream.fromIterable([request]),
        options: options);
  }

  $grpc.ResponseStream<$0.StreamUsersResponse> streamUsers(
      $0.StreamUsersRequest request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(
        _$streamUsers, $async.Stream.fromIterable([request]),
        options: options);
  }
}

abstract class UserServiceBase extends $grpc.Service {
  $core.String get $name => 'events.UserService';

  UserServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.ListUsersRequest, $0.ListUsersResponse>(
        'ListUsers',
        listUsers_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.ListUsersRequest.fromBuffer(value),
        ($0.ListUsersResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetUserRequest, $0.User>(
        'GetUser',
        getUser_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetUserRequest.fromBuffer(value),
        ($0.User value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.CreateUserRequest, $0.User>(
        'CreateUser',
        createUser_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.CreateUserRequest.fromBuffer(value),
        ($0.User value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.UpdateUserRequest, $0.User>(
        'UpdateUser',
        updateUser_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.UpdateUserRequest.fromBuffer(value),
        ($0.User value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.DeleteUserRequest, $1.Empty>(
        'DeleteUser',
        deleteUser_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.DeleteUserRequest.fromBuffer(value),
        ($1.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.StreamUserRequest, $0.StreamUserResponse>(
        'StreamUser',
        streamUser_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $0.StreamUserRequest.fromBuffer(value),
        ($0.StreamUserResponse value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.StreamUsersRequest, $0.StreamUsersResponse>(
            'StreamUsers',
            streamUsers_Pre,
            false,
            true,
            ($core.List<$core.int> value) =>
                $0.StreamUsersRequest.fromBuffer(value),
            ($0.StreamUsersResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.ListUsersResponse> listUsers_Pre($grpc.ServiceCall call,
      $async.Future<$0.ListUsersRequest> request) async {
    return listUsers(call, await request);
  }

  $async.Future<$0.User> getUser_Pre(
      $grpc.ServiceCall call, $async.Future<$0.GetUserRequest> request) async {
    return getUser(call, await request);
  }

  $async.Future<$0.User> createUser_Pre($grpc.ServiceCall call,
      $async.Future<$0.CreateUserRequest> request) async {
    return createUser(call, await request);
  }

  $async.Future<$0.User> updateUser_Pre($grpc.ServiceCall call,
      $async.Future<$0.UpdateUserRequest> request) async {
    return updateUser(call, await request);
  }

  $async.Future<$1.Empty> deleteUser_Pre($grpc.ServiceCall call,
      $async.Future<$0.DeleteUserRequest> request) async {
    return deleteUser(call, await request);
  }

  $async.Stream<$0.StreamUserResponse> streamUser_Pre($grpc.ServiceCall call,
      $async.Future<$0.StreamUserRequest> request) async* {
    yield* streamUser(call, await request);
  }

  $async.Stream<$0.StreamUsersResponse> streamUsers_Pre($grpc.ServiceCall call,
      $async.Future<$0.StreamUsersRequest> request) async* {
    yield* streamUsers(call, await request);
  }

  $async.Future<$0.ListUsersResponse> listUsers(
      $grpc.ServiceCall call, $0.ListUsersRequest request);
  $async.Future<$0.User> getUser(
      $grpc.ServiceCall call, $0.GetUserRequest request);
  $async.Future<$0.User> createUser(
      $grpc.ServiceCall call, $0.CreateUserRequest request);
  $async.Future<$0.User> updateUser(
      $grpc.ServiceCall call, $0.UpdateUserRequest request);
  $async.Future<$1.Empty> deleteUser(
      $grpc.ServiceCall call, $0.DeleteUserRequest request);
  $async.Stream<$0.StreamUserResponse> streamUser(
      $grpc.ServiceCall call, $0.StreamUserRequest request);
  $async.Stream<$0.StreamUsersResponse> streamUsers(
      $grpc.ServiceCall call, $0.StreamUsersRequest request);
}
