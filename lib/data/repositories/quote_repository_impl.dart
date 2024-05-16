

import '../../domain/entities/quote.dart';
import '../../domain/repositories/quote_repository.dart';
import '../datasources/quote_remote_datasource.dart';
import '../models/quote_model.dart';

class QuoteRepositoryImpl extends QuoteRepository {
  final QuoteRemoteDatasource remoteDatasource;

  QuoteRepositoryImpl(this.remoteDatasource);

  @override
  Future<List<Quote>> fetchQuotes() async {
    final List<QuoteModel> quoteModels = await remoteDatasource.fetchQuotes();
    return quoteModels;
  }
}
