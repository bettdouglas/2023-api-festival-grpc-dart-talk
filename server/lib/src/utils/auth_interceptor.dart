import 'package:grpc/grpc.dart';
import 'package:protobuf/protobuf.dart';

import 'auth_utils.dart';

Future<GrpcError?> authInterceptor(
  ServiceCall call,
  ServiceMethod method, {
  List<String> unauthenticatedMethods = const [],
}) async {
  final openMethods = [
    /// Add open methods here
    ...unauthenticatedMethods,
  ];
  final metadata = call.clientMetadata ?? {};
  final methodName = metadata[':path'];
  if (openMethods.contains(methodName)) {
    return null;
  }
  final token = metadata['token'];
  if (token == null) {
    return ServerInterceptorGrpcError(
      serviceCall: call,
      serviceMethod: method,
      error: GrpcError.unauthenticated('Token not found'),
    );
  }
  try {
    final claims = await decodeJwt(token);
    print(claims);
    call.clientMetadata!.addAll(
      claims.map(
        (key, value) => MapEntry(key, value.toString()),
      ),
    );
    return null;
  } on InvalidTokenException {
    return ServerInterceptorGrpcError(
      serviceCall: call,
      serviceMethod: method,
      error: GrpcError.unauthenticated(),
    );
  } catch (e) {
    return ServerInterceptorGrpcError(
      serviceCall: call,
      serviceMethod: method,
      error: GrpcError.unknown(e.toString()),
    );
  }
}

class ServerInterceptorGrpcError implements GrpcError {
  final ServiceCall serviceCall;
  final ServiceMethod serviceMethod;
  final GrpcError error;
  ServerInterceptorGrpcError({
    required this.serviceCall,
    required this.serviceMethod,
    required this.error,
  });

  @override
  int get code => error.code;

  @override
  String get codeName => error.codeName;

  @override
  List<GeneratedMessage>? get details => error.details;

  @override
  String? get message => error.message;

  @override
  Object? get rawResponse => error.rawResponse;

  @override
  Map<String, String>? get trailers => error.trailers;

  @override
  String toString() =>
      'gRPC Error (code: $code, codeName: $codeName, message: $message, '
      'details: $details, rawResponse: $rawResponse, trailers: $trailers)';
}
