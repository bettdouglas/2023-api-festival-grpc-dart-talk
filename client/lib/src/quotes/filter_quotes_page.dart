import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grpc_streaming/src/shared/grpc-gen/index.dart';
import 'package:grpc_streaming/src/shared/service_client_providers.dart';
import 'package:grpc_streaming/src/shared/widgets/error_message_widget.dart';

class FilterQuotesPage extends ConsumerWidget {
  const FilterQuotesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quotesAsyncValue = ref.watch(filteredQuotesProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bidirectional Streaming Quotes List'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Filter by author or keyword',
              ),
              onChanged: (value) {
                ref.read(filterQuotesProvider).filter(value);
              },
            ),
            Expanded(
              child: quotesAsyncValue.map(
                data: (data) => QuotesListView(quotes: data.value),
                error: (error) => ErrorMessageWidgetWithRetry(
                  error.toString(),
                  onRetry: () => ref.invalidate(filteredQuotesProvider),
                  retryText: 'Retry',
                ),
                loading: (_) => const Center(
                  child: CircularProgressIndicator.adaptive(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class QuotesListView extends StatelessWidget {
  const QuotesListView({
    super.key,
    required this.quotes,
  });

  final List<Quote> quotes;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        final quote = quotes[index];
        return Card(
          child: ListTile(
            title: Text(quote.text),
            subtitle: Text(quote.author),
          ),
        );
      },
      itemCount: quotes.length,
    );
  }
}

class FilterQuotesController {
  FilterQuotesController({
    required this.quoteServiceClient,
  }) {
    _streamController = StreamController<String>();
    final filterStream = _streamController.stream.map(
      (event) => FilterQuotesRequest(keyword: event),
    );
    _quotesStream = quoteServiceClient.filterQuotes(filterStream);
  }

  final QuoteServiceClient quoteServiceClient;
  late StreamController _streamController;
  late Stream<FilterQuotesResponse> _quotesStream;

  Stream<FilterQuotesResponse> get quotesStream => _quotesStream;

  void filter(String keyword) async {
    _streamController.add(keyword);
  }

  void dispose() {
    _streamController.close();
  }
}

final filterQuotesProvider = Provider((ref) {
  final quoteServiceClient = QuoteServiceClient(ref.read(channelProvider));
  return FilterQuotesController(quoteServiceClient: quoteServiceClient);
});

final filteredQuotesProvider = StreamProvider<List<Quote>>((ref) {
  final filterQuotesController = ref.read(filterQuotesProvider);
  ref.onDispose(() {
    filterQuotesController.dispose();
  });
  return filterQuotesController.quotesStream.map((event) => event.quotes);
});
