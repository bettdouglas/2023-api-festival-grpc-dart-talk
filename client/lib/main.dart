import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grpc_streaming/src/quotes/bookmarked_quotes_page.dart';
import 'package:grpc_streaming/src/quotes/filter_quotes_page.dart';
import 'package:grpc_streaming/src/quotes/get_quotes_page.dart';
import 'package:grpc_streaming/src/quotes/list_quotes_page.dart';
import 'package:grpc_streaming/src/quotes/stream_quotes_page.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter gRPC Events Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('gRPC Demo'),
          // bottom: const TabBar(
          //   tabs: [
          //     Tab(
          //       text: 'Unary Call',
          //     ),
          //     Tab(
          //       text: 'Client Streaming',
          //     ),
          //     Tab(
          //       text: 'Server Streaming',
          //     ),
          //     Tab(
          //       text: 'Bidirectional Streaming',
          //     ),
          //     Tab(
          //       text: 'Bookmarked Quotes',
          //     ),
          //   ],
          // ),
        ),
        bottomNavigationBar: const TabBar(
          tabs: [
            Tab(
              text: 'Unary Call',
            ),
            Tab(
              text: 'Client Streaming',
            ),
            Tab(
              text: 'Server Streaming',
            ),
            Tab(
              text: 'Bidirectional Streaming',
            ),
            Tab(
              text: 'Bookmarked Quotes',
            ),
          ],
        ),
        body: const TabBarView(
          children: [
            GetQuotePage(),
            ListQuotesPage(),
            StreamQuotesPage(),
            FilterQuotesPage(),
            BookmarkedQuotesPage(),
          ],
        ),
      ),
    );
  }
}
