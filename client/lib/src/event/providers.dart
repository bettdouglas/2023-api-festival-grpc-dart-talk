import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grpc_streaming/src/shared/client_channel.dart';
import 'package:grpc_streaming/src/shared/grpc-gen/index.dart';

final eventServiceClientProvider = Provider<EventServiceClient>((ref) {
  return EventServiceClient(clientChannel);
});
