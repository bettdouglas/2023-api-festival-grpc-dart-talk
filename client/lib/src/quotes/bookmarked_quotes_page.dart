import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grpc_streaming/src/quotes/get_quotes_page.dart';
import 'package:grpc_streaming/src/quotes/list_quotes_page.dart';

class BookmarkedQuotesPage extends ConsumerWidget {
  const BookmarkedQuotesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bookmarkedQuotesNotifier = ref.watch(bookmarkedQuotesProvider);
    final favorites = bookmarkedQuotesNotifier.favorites;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Bookmarked Quotes'),
      ),
      body: QuotesListView(
        quotes: favorites,
        onQuoteFavorited: (q) {},
      ),
    );
  }
}
