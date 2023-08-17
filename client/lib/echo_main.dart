import 'package:flutter/material.dart';
import 'package:grpc_streaming/src/echo/server_streaming_echo_page.dart';
import 'package:grpc_streaming/src/echo/unary_echo_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter gRPC Streaming Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const EchoPage(),
    );
  }
}

class EchoPage extends StatelessWidget {
  const EchoPage({super.key});

  @override
  Widget build(BuildContext context) {
    final tabs = [
      'Unary',
      'Server Streaming',
      'Client Streaming',
      'Bidirectional Streaming',
    ];
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Echo Page'),
          bottom: TabBar(tabs: tabs.map((e) => Tab(text: e)).toList()),
        ),
        body: const TabBarView(
          children: [
            UnaryEchoPage(),
            ServerStreamingEchoPage(),
            ClientStreamingEchoPage(),
            BidirectionalStreamingEchoPage(),
          ],
        ),
      ),
    );
  }
}

class ClientStreamingEchoPage extends StatelessWidget {
  const ClientStreamingEchoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class BidirectionalStreamingEchoPage extends StatelessWidget {
  const BidirectionalStreamingEchoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
