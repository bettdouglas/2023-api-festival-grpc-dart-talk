import 'dart:io';

import 'package:grpc/grpc.dart';
import 'package:grpg_streaming/src/services/echo_service.dart';

void main(List<String> args) async {
  // Use any available host or container IP (usually `0.0.0.0`).

  final ip = InternetAddress.anyIPv4;
  final port = int.parse(Platform.environment['PORT'] ?? '8080');

  final server = Server.create(
    services: [EchoServiceImplementation()],
    interceptors: [
      // loggingInterceptor,
    ],
  );

  // For running in containers, we respect the PORT environment variable.
  await server.serve(address: ip, port: port);
}
