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
    final randomIntState = ref.watch(randomIntFutureProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Get a Random Quote'),
        actions: [
          randomIntState.when(
            data: (randomInt) => Text(randomInt.toString()),
            error: (_, __) => const Text('-1'),
            loading: () => const Text('0'),
          ),
        ],
      ),
      body: quoteAsyncValue.when(
        data: (quote) => Container(
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
                    quote.text,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const Divider(),
                  Text(
                    quote.author,
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
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      ref
                          .read(bookmarkedQuotesProvider.notifier)
                          .addQuote(quote);
                    },
                    child: const Text('Favorite Quote'),
                  ),
                ],
              ),
            ),
          ),
        ),
        error: (error, _) => ErrorMessageWidgetWithRetry(
          error.toString(),
          onRetry: () => ref.refresh(getQuoteProvider),
        ),
        loading: () => const Center(
          child: CircularProgressIndicator.adaptive(),
        ),
      ),
    );
  }
}

final getQuoteProvider = FutureProvider<Quote>((ref) async {
  final channel = ref.read(channelProvider);
  final client = QuoteServiceClient(channel);

  Quote quote = await client.getQuote(GetQuoteRequest());
  return quote;
});

final randomIntFutureProvider = FutureProvider<int>((ref) async {
  // final state = ref.watch(getQuoteProvider);
  // return state.when(
  //   data: (quote) => quote.text.length,
  //   error: (error, stackTrace) => -1,
  //   loading: () => 0,
  // );
  await Future.delayed(const Duration(seconds: 4));
  return 10;
});

class BookmarkedQuotesChangeNotifier extends ChangeNotifier {
  final _favorites = <Quote>[];

  List<Quote> get favorites => _favorites;

  void addQuote(Quote quote) {
    _favorites.add(quote);
    notifyListeners();
  }

  void removeQuote(Quote quote) {
    _favorites.remove(quote);
    notifyListeners();
  }
}

final bookmarkedQuotesProvider = ChangeNotifierProvider(
  (ref) => BookmarkedQuotesChangeNotifier(),
);
