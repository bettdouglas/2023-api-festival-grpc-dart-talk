import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grpc/grpc.dart';
import 'package:grpc_streaming/src/auth/provider/auth_state_notifier.dart';

class LoggedInUserTokenInterceptor extends ClientInterceptor {
  final Ref ref;
  LoggedInUserTokenInterceptor({
    required this.ref,
  });

  @override
  ResponseStream<R> interceptStreaming<Q, R>(
    ClientMethod<Q, R> method,
    Stream<Q> requests,
    CallOptions options,
    ClientStreamingInvoker<Q, R> invoker,
  ) {
    final modifiedOptions = options.mergedWith(
      CallOptions(
        providers: [
          (metadata, uri) => _injectMetadata(metadata, uri),
        ],
      ),
    );

    final response = super.interceptStreaming(
      method,
      requests,
      modifiedOptions,
      invoker,
    );
    // response.forEach((element) {
    //   log(
    //     'Grpc response:'
    //     '\nMethod: ${method.path}'
    //     '\nRequests: $requests'
    //     '\nResponse: $element',
    //   );
    // });
    return response;
  }

  @override
  ResponseFuture<R> interceptUnary<Q, R>(
    ClientMethod<Q, R> method,
    Q request,
    CallOptions options,
    ClientUnaryInvoker<Q, R> invoker,
  ) {
    final modifiedOptions = options.mergedWith(
      CallOptions(
        providers: [
          (metadata, uri) {
            _injectMetadata(metadata, uri);
            print(metadata);
          },
        ],
      ),
    );
    final response = super.interceptUnary(
      method,
      request,
      modifiedOptions,
      invoker,
    );
    // response.then((r) {
    //   log(
    //     'Grpc response:'
    //     '\nMethod: ${method.path}'
    //     '\nRequest: $request'
    //     '\nResponse: $r',
    //   );
    // });
    return response;
  }

  void _injectMetadata(
    Map<String, String> metadata,
    String uri,
  ) {
    final user = ref.read(authStateProvider).maybeWhen(
          orElse: () => null,
          authenticated: (user) => user,
        );
    if (user != null) {
      // metadata = {
      //   ...metadata,
      //   'Authorization': user.jwt,
      // };
      metadata['token'] = user.jwt;
      log(metadata.toString());
    }
  }
}
