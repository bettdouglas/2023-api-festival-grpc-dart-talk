import 'package:build_grpc_channel/build_grpc_channel.dart';

final clientChannel = buildGrpcChannel(
  host: 'localhost',
  port: 8080,
  secure: false,
);


// final clientChannelProvider = Provider<ClientChannel>((ref) {
//   return clientChannel;
// });