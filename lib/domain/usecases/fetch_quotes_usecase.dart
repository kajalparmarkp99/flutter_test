

import '../entities/quote.dart';
import '../repositories/quote_repository.dart';

class FetchQuotesUsecase {
  final QuoteRepository repository;

  FetchQuotesUsecase(this.repository);

  Future<List<Quote>> call() async {
    return await repository.fetchQuotes();
  }
}
