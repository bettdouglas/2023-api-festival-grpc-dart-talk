import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:fpdart/fpdart.dart';
import 'package:grpg_streaming/src/generated/index.dart';

class QuotesDatabase {
  final _quotes = Option<List<Quote>>.none();
  final _favorites = <String, List<Quote>>{};

  Future<List<Quote>> getQuotes() async {
    return _quotes.fold(
      () async {
        final quotes = await _fetchQuotes();
        return quotes;
      },
      (t) async => t,
    );
  }

  Future<Quote> getQuote() async {
    final quotes = await getQuotes();
    // random quote
    return quotes.elementAt(Random().nextInt(max(quotes.length, 1)));
  }

  Future<List<Quote>> getNQuotes(int count) {
    final future = List.generate(count, (index) => getQuote());
    return Future.wait(future);
  }

  Future<List<Quote>> _fetchQuotes() async {
    final quotesFile = File('quotes.json');
    if (!(await quotesFile.exists())) {
      throw Exception('Quotes file not found');
    }
    final fileContents = await quotesFile.readAsString();
    final quotes = json.decode(fileContents) as List;
    return quotes.map((e) {
      return Quote(
        author: e['author'] as String,
        text: e['text'] as String,
      );
    }).toList();
  }

  Future<List<Quote>> filterQuotes(String filter) async {
    final quotes = await getQuotes();
    return quotes.where((quote) {
      filter = filter.toLowerCase();
      final quoteText = quote.text.toLowerCase();
      final author = quote.author.toLowerCase();
      return quoteText.contains(filter) || author.contains(filter);
    }).toList();
  }

  Future<List<Quote>> getFavorites(String userId) async {
    return _favorites[userId] ?? [];
  }

  Future<void> addFavorite(String userId, Quote quote) async {
    final favorites = await getFavorites(userId);
    _favorites[userId] = [...favorites, quote];
  }
}
