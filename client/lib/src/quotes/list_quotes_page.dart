// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grpc_streaming/src/shared/grpc-gen/index.dart';
import 'package:grpc_streaming/src/shared/service_client_providers.dart';
import 'package:grpc_streaming/src/shared/widgets/error_message_widget.dart';

class ListQuotesPage extends ConsumerWidget {
  const ListQuotesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quotesAsyncValue = ref.watch(quotesProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quotes List'),
      ),
      body: quotesAsyncValue.map(
        data: (data) => QuotesListView(quotes: data.value),
        error: (error) => ErrorMessageWidget(error.toString()),
        loading: (_) => const Center(
          child: CircularProgressIndicator.adaptive(),
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

final quotesProvider = FutureProvider<List<Quote>>((ref) async {
  final client = QuoteServiceClient(ref.read(channelProvider));
  final response = await client.listQuotes(ListQuotesRequest());
  print('response');
  return response.quotes;
});
