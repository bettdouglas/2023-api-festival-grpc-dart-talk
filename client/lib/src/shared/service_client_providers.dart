// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:build_grpc_channel/build_grpc_channel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grpc_streaming/src/shared/grpc-gen/index.dart';
import 'package:grpc_streaming/src/shared/user_token_interceptor.dart';

const host = 'http://localhost';
// const _proxy = 'https://meo-lab-grpc-proxy-server-oentpvkuua-oa.a.run.app';
const port = 8080;

final devChannelProvider = Provider((ref) {
  return buildGrpcChannel(host: 'http://localhost', port: 8080, secure: false);
});

final channelProvider = Provider((ref) {
  return buildGrpcChannel(host: host, port: port, secure: false);
});

final userServiceClientProvider = Provider<UserServiceClient>((ref) {
  return UserServiceClient(
    ref.read(channelProvider),
    interceptors: [
      ref.read(userTokenInterceptorProvider),
    ],
  );
});

final userTokenInterceptorProvider = Provider(
  (ref) => LoggedInUserTokenInterceptor(ref: ref),
);
