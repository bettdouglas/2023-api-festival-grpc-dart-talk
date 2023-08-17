import 'dart:developer';
import 'dart:io';

import 'package:grpc/grpc.dart';
import 'package:grpg_streaming/src/database/database.dart';
import 'package:grpg_streaming/src/services/event_service.dart';
import 'package:grpg_streaming/src/services/quote_service.dart';
import 'package:grpg_streaming/src/services/user_service.dart';

void main(List<String> args) async {
  // Use any available host or container IP (usually `0.0.0.0`).
  final ip = InternetAddress.anyIPv4;
  final port = int.parse(Platform.environment['PORT'] ?? '8080');

  final isTestMode = Platform.environment['TEST_MODE'] == 'true';

  final queryExecutor = isTestMode
      ? EventsDatabase.openMemoryDatabase()
      : EventsDatabase.openNativeDatabase('events.db');

  final database = EventsDatabase(queryExecutor);

  final server = Server.create(
    services: [
      UserService(database: database),
      EventService(database: database),
      QuoteService(),
    ],
    interceptors: [
      loggingInterceptor,
      // (call, method) {
      //   return authInterceptor(
      //     call,
      //     method,
      //     unauthenticatedMethods: [],
      //   );
      // }
    ],
    errorHandler: (error, trace) {
      stderr.write(error);
    },
  );

  // For running in containers, we respect the PORT environment variable.
  await server.serve(
    address: ip,
    port: port,
    // security: ServerTlsCredentials(),
  );
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
