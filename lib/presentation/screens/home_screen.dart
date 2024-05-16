import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_app/presentation/screens/qoute_details_screen.dart';
import 'package:shimmer/shimmer.dart';
import '../../data/datasources/quote_remote_datasource.dart';
import '../../data/repositories/quote_repository_impl.dart';
import '../../domain/entities/quote.dart';
import '../../domain/usecases/fetch_quotes_usecase.dart';

final fetchQuotesUsecaseProvider = Provider<FetchQuotesUsecase>((ref) {
  return FetchQuotesUsecase(QuoteRepositoryImpl(QuoteRemoteDatasource(Dio())));
});

final quotesProvider = FutureProvider<List<Quote>>((ref) async {
  final fetchQuotesUsecase = ref.watch(fetchQuotesUsecaseProvider);
  return fetchQuotesUsecase();
});

class HomeScreen extends ConsumerWidget {
  final FetchQuotesUsecase fetchQuotesUsecase;

  const HomeScreen({Key? key, required this.fetchQuotesUsecase}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quotesAsyncValue = ref.watch(quotesProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade50,
        bottomOpacity: 5,
        centerTitle: true,
        title: const Text('Home',textAlign: TextAlign.center,style: TextStyle(fontSize: 22,fontWeight: FontWeight.w500)),
      ),
      body: quotesAsyncValue.when(
        data: (quotes) {
          return ListView.builder(
            itemCount: quotes.length,
            itemBuilder: (context, index) {
              final quote = quotes[index];
              return ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => QuoteDetailsScreen(quote: quote),
                    ),
                  );
                },
                title: Text('${index+1}."${quote.content}"'),
              );
            },
          );
        },
        loading: () => Shimmer.fromColors(
          baseColor: Colors.grey[200]!,
          highlightColor: Colors.grey[100]!,
          child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return ListTile(
                title: Container(
                  width: double.infinity,
                  height: 40.0,
                  color: Colors.white,
                ),
              );
            },
          ),
        ),
        error: (error, stackTrace) => Center(child: Text('Error: $error')),
      ),
    );
  }
}
