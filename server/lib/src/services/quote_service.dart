import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:fpdart/fpdart.dart';
import 'package:grpc/grpc.dart';
import 'package:grpg_streaming/src/generated/index.dart';
import 'package:rxdart/rxdart.dart';

class QuoteService extends QuoteServiceBase {
  final quotesDb = QuotesDatabase();

  @override
  Future<Quote> getQuote(
    ServiceCall call,
    GetQuoteRequest request,
  ) {
    return quotesDb.getQuote();
  }

  @override
  Future<ListQuotesResponse> listQuotes(
    ServiceCall call,
    ListQuotesRequest request,
  ) async {
    final numberOfQuotes =
        request.numberOfQuotes == 0 ? 10 : request.numberOfQuotes;
    final randomNQuotes = await quotesDb.getNQuotes(numberOfQuotes);
    return ListQuotesResponse(quotes: randomNQuotes);
  }

  @override
  Stream<Quote> streamQuotes(
    ServiceCall call,
    StreamQuotesRequest request,
  ) {
    final durationInSeconds = request.streamIntervalInSeconds;
    final stream = Stream.periodic(
      Duration(seconds: durationInSeconds),
      (count) async => count,
    );
    stream.doOnCancel(() => print('Client cancelled stream'));
    return stream.asyncMap((event) async => await quotesDb.getQuote());
  }

  @override
  Stream<FilterQuotesResponse> filterQuotes(
    ServiceCall call,
    Stream<FilterQuotesRequest> request,
  ) {
    throw UnimplementedError();
  }
}

class QuotesDatabase {
  final _quotes = Option<List<Quote>>.none();

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
    final fileContents = await File('quotes.json').readAsString();
    final quotes = json.decode(fileContents) as List;
    return quotes.map((e) {
      return Quote(
        author: e['author'] as String,
        text: e['text'] as String,
      );
    }).toList();
  }
}
