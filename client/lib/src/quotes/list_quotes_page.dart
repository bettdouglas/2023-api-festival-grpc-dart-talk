// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:grpc/service_api.dart';
import 'package:grpc_streaming/src/quotes/get_quotes_page.dart';
import 'package:grpc_streaming/src/shared/grpc-gen/index.dart';
import 'package:grpc_streaming/src/shared/service_client_providers.dart';
import 'package:grpc_streaming/src/shared/widgets/error_message_widget.dart';
import 'package:rxdart/rxdart.dart';
import 'package:uuid/uuid.dart';

class ListQuotesPage extends ConsumerWidget {
  const ListQuotesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quotesAsyncValue = ref.watch(quotesProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quotes List'),
      ),
      body: quotesAsyncValue.when(
        data: (quotes) => Column(
          children: [
            Expanded(
              child: QuotesListView(
                quotes: quotes,
                onQuoteFavorited: (quote) {
                  ref
                      .read(userFavoritesSubjectProvider.notifier)
                      .favorite(quote);
                  ref.read(bookmarkedQuotesProvider.notifier).addQuote(quote);
                  print('Favorited');
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () => ref.invalidate(quotesProvider),
                    child: const Text('Refresh Quotes List'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () =>
                        ref.read(userFavoritesSubjectProvider).closeStream(),
                    child: const Text('Close Client Stream'),
                  ),
                ),
              ],
            ),
          ],
        ),
        error: (error, _) => ErrorMessageWidgetWithRetry(
          error.toString(),
          onRetry: () => ref.invalidate(quotesProvider),
        ),
        loading: () => const Center(
          child: CircularProgressIndicator.adaptive(),
        ),
      ),
    );
  }
}

class QuotesListView extends ConsumerWidget {
  const QuotesListView({
    super.key,
    required this.quotes,
    required this.onQuoteFavorited,
  });

  final List<Quote> quotes;
  final Function(Quote) onQuoteFavorited;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(
      userFavoritesSubjectProvider,
      (previous, next) {
        next.response.fold(
          () => null,
          (t) {
            showGeneralDialog(
              context: context,
              pageBuilder: (context, _, __) {
                return AlertDialog(
                  title: const Text('Favorited Quotes for this session'),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      for (final quote in t.favorites) ...[
                        ListTile(
                          title: Text(quote.text),
                          subtitle: Text(quote.author),
                        ),
                        const Divider(),
                      ],
                    ],
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text('Close'),
                    ),
                  ],
                );
              },
            );
          },
        );
      },
    );

    return ListView.builder(
      itemBuilder: (context, index) {
        final quote = quotes[index];
        final isFavoritedAsyncValue =
            ref.watch(isFavoritedFutureProvider(quote.text));

        return Card(
          child: ListTile(
            title: Text(quote.text),
            subtitle: Text(quote.author),
            trailing: IconButton(
              onPressed: () => onQuoteFavorited(quote),
              icon: isFavoritedAsyncValue.when(
                data: (isFavorited) => Icon(
                  Icons.favorite,
                  color: isFavorited ? Colors.red : Colors.transparent,
                ),
                error: (_, __) => const Icon(Icons.error),
                loading: () => const Icon(Icons.favorite_border),
              ),
            ),
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

class UserFavoritesStateNotifier extends ChangeNotifier {
  UserFavoritesStateNotifier({
    required this.client,
  }) {
    init();
  }

  init() async {
    subject = BehaviorSubject<Quote>();
    response = const None();
    subject.listen((quote) {
      favorites.add(quote);
    });
    final sessionUserIdProvider = const Uuid().v4();
    final favoriteQuotes = await client.favoriteQuotes(
      subject.stream,
      options: CallOptions(
        metadata: {'user_id': sessionUserIdProvider},
      ),
    );
    response = Some(favoriteQuotes);
    notifyListeners();
  }

  final QuoteServiceClient client;

  late BehaviorSubject<Quote> subject;
  final favorites = <Quote>[];
  late Option<FavoriteQuotesResponse> response;

  void favorite(Quote quote) async {
    if (subject.isClosed) {
      init();
    }
    subject.add(quote);
    notifyListeners();
  }

  void closeStream() {
    subject.close();
    notifyListeners();
  }
}

final userFavoritesSubjectProvider =
    ChangeNotifierProvider<UserFavoritesStateNotifier>(
  (ref) => UserFavoritesStateNotifier(
    client: QuoteServiceClient(ref.read(channelProvider)),
  ),
);

final isFavoritedFutureProvider = FutureProvider.family<bool, String>(
  (ref, String quote) async {
    final sn = ref.watch(userFavoritesSubjectProvider);
    return sn.favorites.map((quote) => quote.text).contains(quote);
  },
);
