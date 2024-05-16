import 'package:dio/dio.dart';

import '../models/quote_model.dart';

class QuoteRemoteDatasource {
  final Dio dio;

  QuoteRemoteDatasource(this.dio);

  Future<List<QuoteModel>> fetchQuotes() async {
    try {
      final response = await dio.get('https://api.quotable.io/quotes/random?limit=50');
      final List<dynamic> jsonList = response.data;
      return jsonList.map((json) => QuoteModel.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Failed to fetch quotes: $e');
    }
  }
}
