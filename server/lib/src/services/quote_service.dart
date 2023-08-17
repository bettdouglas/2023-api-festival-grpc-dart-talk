import 'package:grpc/grpc.dart';
import 'package:grpg_streaming/src/database/quotes_database.dart';
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
  ) async* {
    request.doOnCancel(() => print('Client cancelled stream'));
    await for (var filterRequest in request) {
      final filter = filterRequest.keyword;
      final filteredQuotes = await quotesDb.filterQuotes(filter);
      yield FilterQuotesResponse(quotes: filteredQuotes);
    }
  }
}
