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
  ) async {
    Quote quote = await quotesDb.getQuote();
    return quote;
  }

  @override
  Future<ListQuotesResponse> listQuotes(
    ServiceCall call,
    ListQuotesRequest request,
  ) async {
    final numberOfQuotes =
        request.numberOfQuotes == 0 ? 10 : request.numberOfQuotes;
    List<Quote> randomNQuotes = await quotesDb.getNQuotes(numberOfQuotes);
    return ListQuotesResponse(quotes: randomNQuotes);
  }

  @override
  Stream<Quote> streamQuotes(
    ServiceCall call,
    StreamQuotesRequest request,
  ) {
    int durationInSeconds = request.streamIntervalInSeconds;
    Stream<int> periodicStream = Stream.periodic(
      Duration(seconds: durationInSeconds),
      (count) => count,
    );
    periodicStream.doOnCancel(() => print('Client cancelled stream'));

    return periodicStream.asyncMap((event) async {
      Quote quote = await quotesDb.getQuote();
      print('Sending quote: $quote to client');
      return quote;
    });
  }

  @override
  Stream<FilterQuotesResponse> filterQuotes(
    ServiceCall call,
    Stream<FilterQuotesRequest> request,
  ) async* {
    request.doOnCancel(() => print('Client cancelled stream'));
    await for (FilterQuotesRequest filterRequest in request) {
      final filter = filterRequest.keyword;
      List<Quote> filteredQuotes = await quotesDb.filterQuotes(filter);

      /// yield is used to emit a value as a response to the client
      yield FilterQuotesResponse(quotes: filteredQuotes);
    }
  }

  @override
  Future<FavoriteQuotesResponse> favoriteQuotes(
    ServiceCall call,
    Stream<Quote> request,
  ) async {
    Map<String, String> headers = call.clientMetadata ?? {};
    String? userId = headers['user_id'];
    if (userId == null) {
      throw GrpcError.unauthenticated('User not authenticated');
    }
    await for (Quote quote in request) {
      await quotesDb.addFavorite(userId, quote);
    }
    List<Quote> favorites = await quotesDb.getFavorites(userId);
    print(favorites);
    call.trailers?.addAll({'user_id': userId});
    return FavoriteQuotesResponse(favorites: favorites);
  }
}
