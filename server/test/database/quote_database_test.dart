import 'package:grpg_streaming/src/database/quotes_database.dart';
import 'package:test/test.dart';

void main() {
  late QuotesDatabase quotesDatabase;

  setUp(() {
    quotesDatabase = QuotesDatabase();
  });

  test('can fetch quotes', () async {
    final quotes = await quotesDatabase.getQuotes();
    expect(quotes, isNotEmpty);
  });

  test('can get a quote', () async {
    final quote = await quotesDatabase.getQuote();
    expect(quote, isNotNull);
  });

  test('can get N quotes', () async {
    final count = 5;
    final quotes = await quotesDatabase.getNQuotes(count);
    expect(quotes, hasLength(count));
  });
}
