import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grpc_streaming/src/shared/grpc-gen/index.dart';
import 'package:grpc_streaming/src/shared/service_client_providers.dart';
import 'package:grpc_streaming/src/shared/widgets/error_message_widget.dart';

class GetQuotePage extends ConsumerWidget {
  const GetQuotePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quoteAsyncValue = ref.watch(getQuoteProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Get a Random Quote'),
        actions: const [],
      ),
      body: quoteAsyncValue.map(
        data: (data) => Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(16),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    data.value.text,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const Divider(),
                  Text(
                    data.value.author,
                    style: const TextStyle(
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () => ref.invalidate(getQuoteProvider),
                    child: const Text('Get another quote'),
                  ),
                ],
              ),
            ),
          ),
        ),
        error: (error) => ErrorMessageWidget(error.toString()),
        loading: (loading) => const Center(
          child: CircularProgressIndicator.adaptive(),
        ),
      ),
    );
  }
}

final getQuoteProvider = FutureProvider<Quote>((ref) async {
  final client = QuoteServiceClient(ref.read(channelProvider));
  return client.getQuote(GetQuoteRequest());
});