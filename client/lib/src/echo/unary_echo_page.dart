import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart' hide State;
import 'package:grpc/grpc.dart';
import 'package:grpc_streaming/src/shared/client_channel.dart';
import 'package:grpc_streaming/src/shared/grpc-gen/index.dart';

class UnaryEchoPage extends StatefulWidget {
  const UnaryEchoPage({super.key});

  @override
  State<UnaryEchoPage> createState() => _UnaryEchoPageState();
}

class _UnaryEchoPageState extends State<UnaryEchoPage> {
  final echoController = TextEditingController();
  final countController = TextEditingController(text: '2');

  Either<String, EchoResponse>? response;

  var isFormValid = false;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      onChanged: () => setState(() {
        isFormValid = _formKey.currentState?.validate() ?? false;
      }),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextFormField(
              controller: echoController,
              validator: (value) => value!.isEmpty ? 'Required' : null,
            ),
            const SizedBox(height: 8),
            TextFormField(
              controller: countController,
              decoration: const InputDecoration(
                hintText: 'Number of times to echo',
              ),
              validator: (value) {
                if (value == null) {
                  return 'Required';
                }
                final number = int.tryParse(value);
                if (number == null) {
                  return 'Must be a number';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            OutlinedButton(
              onPressed: isFormValid ? sendEchoRequest : null,
              child: const Text('Send Echo Request'),
            ),
            const SizedBox(height: 16),
            if (response != null)
              response!.fold(
                (l) => Text(
                  l,
                  style: const TextStyle(color: Colors.red),
                ),
                (r) => Text(r.values.map((e) => e).join(', ')),
              )
          ],
        ),
      ),
    );
  }

  void sendEchoRequest() async {
    try {
      final request = EchoRequest(
        value: echoController.text,
        extraTimes: int.parse(countController.text),
      );
      final echoClient = EchoClient(clientChannel);
      final response = await echoClient.echo(request);
      setState(() {
        this.response = right(response);
      });
    } on GrpcError catch (e) {
      setState(() {
        response = left(e.toString());
      });
    }
  }
}
