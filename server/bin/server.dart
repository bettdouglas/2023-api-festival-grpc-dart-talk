import 'dart:developer';
import 'dart:io';

import 'package:grpc/grpc.dart';
import 'package:grpg_streaming/src/services/quote_service.dart';

void main(List<String> args) async {
  // Use any available host or container IP (usually `0.0.0.0`).
  final ip = InternetAddress.anyIPv4;
  final port = int.parse(Platform.environment['PORT'] ?? '8080');

  final server = Server.create(
    services: [
      // EventService(database: database),
      // UserService(database: database),
      QuoteService(),
    ],
  );

  // For running in containers, we respect the PORT environment variable.
  await server.serve(address: ip, port: port);
  print('Server listening on port ${server.port}');
}

Future<GrpcError?> loggingInterceptor(
  ServiceCall call,
  ServiceMethod method,
) async {
  final dateTime = DateTime.now();
  final clientMetadata = call.clientMetadata ?? {};
  final authority = clientMetadata[':authority'];
  final methodName = clientMetadata[':path'];
  final method = clientMetadata[':method'];
  final userAgent = clientMetadata['user-agent'];

  log('$authority - - [$dateTime] $method $methodName $userAgent');
  return null;
}
