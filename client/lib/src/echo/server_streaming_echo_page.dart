import 'dart:async';

import 'package:flutter/material.dart';
import 'package:grpc_streaming/src/shared/client_channel.dart';
import 'package:grpc_streaming/src/shared/grpc-gen/index.dart';

class ServerStreamingEchoPage extends StatefulWidget {
  const ServerStreamingEchoPage({super.key});

  @override
  State<ServerStreamingEchoPage> createState() =>
      _ServerStreamingEchoPageState();
}

class _ServerStreamingEchoPageState extends State<ServerStreamingEchoPage> {
  final echoController = TextEditingController();

  final countController = TextEditingController(text: '2');

  var isFormValid = false;

  final _formKey = GlobalKey<FormState>();
  Stream<EchoStreamResponse>? echoStream;
  StreamSubscription<EchoStreamResponse>? echoStreamSubscription;

  final echoes = <String>[];

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      onChanged: () => setState(() {
        isFormValid = _formKey.currentState?.validate() ?? false;
      }),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
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
              if (echoStream != null)
                StreamBuilder(
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Text(snapshot.data.toString());
                    } else if (snapshot.hasError) {
                      return Text(
                        'ERROR!. ${snapshot.error!}',
                        style: const TextStyle(color: Colors.red),
                      );
                    } else {
                      return const Text('Waiting for response...');
                    }
                  },
                  stream: echoStream!,
                ),
              const SizedBox(height: 16),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      const Text('Responses'),
                      const SizedBox(height: 8),
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: echoes.length,
                        itemBuilder: (context, index) {
                          return Text(echoes[index]);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void sendEchoRequest() {
    final echo = echoController.text;
    final count = int.parse(countController.text);
    echoStreamSubscription?.cancel();
    setState(() {
      echoes.clear();
    });
    final echoClient = EchoClient(clientChannel);
    echoStream = echoClient
        .echoStream(EchoRequest(extraTimes: count, value: echo))
        .asBroadcastStream();

    echoStreamSubscription = echoStream!.listen((value) {
      setState(() {
        echoes.add(value.value);
      });
    });
  }

  @override
  void dispose() {
    echoStreamSubscription?.cancel();
    super.dispose();
  }
}
