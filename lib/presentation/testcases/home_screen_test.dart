// test/presentation/screens/home_screen_test.dart

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:my_app/domain/entities/quote.dart';
import 'package:my_app/presentation/screens/home_screen.dart';

import '../../domain/usecases/fetch_quotes_usecase.dart';

class MockFetchQuotesUseCase extends Mock implements FetchQuotesUsecase {}

void main() {
  group('HomeScreen', () {
    late FetchQuotesUsecase mockUseCase;

    setUp(() {
      mockUseCase = MockFetchQuotesUseCase();
    });

    testWidgets('loading state', (WidgetTester tester) async {
      when(mockUseCase()).thenAnswer((_) => Future.delayed(const Duration(milliseconds: 100), () => <Quote>[]));

      await tester.pumpWidget(MaterialApp(
        home: HomeScreen(fetchQuotesUsecase: mockUseCase),
      ));

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('renders data state', (WidgetTester tester) async {
      when(mockUseCase()).thenAnswer((_) => Future.value([
        const Quote(content: 'Test Quote 1', author: 'Test Author 1', id: '1'),
        const Quote(content: 'Test Quote 2', author: 'Test Author 2',id: '2'),
      ]));

      await tester.pumpWidget(MaterialApp(
        home: HomeScreen(fetchQuotesUsecase: mockUseCase),
      ));

      expect(find.text('Test Quote 1'), findsOneWidget);
      expect(find.text('Test Quote 2'), findsOneWidget);
    });

    testWidgets('renders error state', (WidgetTester tester) async {
      when(mockUseCase()).thenThrow(Exception('Test Error'));

      await tester.pumpWidget(MaterialApp(
        home: HomeScreen(fetchQuotesUsecase: mockUseCase),
      ));

      expect(find.text('Error: Test Error'), findsOneWidget);
    });
  });
}
