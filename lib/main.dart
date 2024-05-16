import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_app/presentation/screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  ProviderScope(
      child: MaterialApp(
        home:Consumer(builder: (context, ref, _) {
          final fetchQuotesUsecase = ref.read(fetchQuotesUsecaseProvider);
          return HomeScreen(fetchQuotesUsecase: fetchQuotesUsecase);
        }),
      ),
    );
  }
}