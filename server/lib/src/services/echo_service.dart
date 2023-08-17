import 'package:grpc/grpc.dart';
import 'package:grpg_streaming/src/generated/echo_service.pbgrpc.dart';

class EchoServiceImplementation extends EchoServiceBase {
  @override
  Future<EchoResponse> echo(ServiceCall call, EchoRequest request) async {
    int count = request.extraTimes;
    String value = request.value;
    return EchoResponse(
      values: List.generate(count, (index) => value),
    );
  }

  @override
  Stream<EchoStreamResponse> echoStream(ServiceCall call, EchoRequest request) {
    int count = request.extraTimes;
    String value = request.value;
    final values = List.generate(count, (index) => '$value $index');
    return Stream.fromIterable(values).asyncMap(
      (event) async {
        await Future.delayed(Duration(milliseconds: 100));
        return EchoStreamResponse(value: event);
      },
    );
  }
}
