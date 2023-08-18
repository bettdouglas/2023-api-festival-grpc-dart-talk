import 'package:build_grpc_channel/build_grpc_channel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grpc/service_api.dart';
import 'package:grpc_streaming/src/shared/grpc-gen/index.dart';
import 'package:grpc_streaming/src/shared/service_client_providers.dart';
import 'package:grpc_streaming/src/shared/widgets/error_message_widget.dart';

class StreamQuotesPage extends ConsumerWidget {
  const StreamQuotesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quoteAsyncValue = ref.watch(streamQuotesProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Stream of Random Quotes'),
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
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(fontSize: 25, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
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
                    onPressed: () => ref.invalidate(streamQuotesProvider),
                    child: const Text('Cancel Stream'),
                  ),
                ],
              ),
            ),
          ),
        ),
        error: (error) => ErrorMessageWidgetWithRetry(
          error.toString(),
          onRetry: () => ref.refresh(streamQuotesProvider),
        ),
        loading: (loading) => const Center(
          child: CircularProgressIndicator.adaptive(),
        ),
      ),
    );
  }
}

final streamQuotesProvider = StreamProvider<Quote>((ref) async* {
  ClientChannel channel = buildGrpcChannel(
    host: host,
    port: port,
    secure: false,
  );
  QuoteServiceClient client = QuoteServiceClient(channel);
  Stream<Quote> stream = client.streamQuotes(
    StreamQuotesRequest(streamIntervalInSeconds: 2),
  );
  await for (final quote in stream) {
    yield quote;
  }
});
