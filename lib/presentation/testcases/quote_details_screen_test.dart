import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_app/domain/entities/quote.dart';
import '../screens/qoute_details_screen.dart';


void main() {
  testWidgets('QuoteDetailsScreen displays correctly', (WidgetTester tester) async {
    const quote = Quote(
      content: 'Test Quote',
      author: 'Test Author',
      dateAdded: "15-05-2024",
      dateModified: "15-05-2024",
      tags: ['Tag1', 'Tag2'], id: '1',
    );

    await tester.pumpWidget(const MaterialApp(
      home: QuoteDetailsScreen(quote: quote),
    ));

    expect(find.text('Test Quote'), findsOneWidget);
    expect(find.text('Test Author'), findsOneWidget);
    expect(find.text('Tag1'), findsOneWidget);
    expect(find.text('Tag2'), findsOneWidget);
    expect(find.text('15-05-2024'), findsOneWidget);
    expect(find.text('16-05-2024'), findsOneWidget);
  });
}