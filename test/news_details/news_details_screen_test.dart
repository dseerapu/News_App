import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:news_app/news/repository/news_repository.dart';
import 'package:news_app/news/model/news_model.dart';
import 'package:news_app/news_details/news_details.dart';

import '../news/widget/news_screen_test.mocks.dart';

@GenerateMocks([NewsRepository])
void main() {
  testWidgets('NewsDetailsScreen shows news details when data is loaded', (WidgetTester tester) async {
    // Arrange
    final mockNewsRepository = MockNewsRepository();
    final mockNews = [
      const News(title: 'Test News 1', description: 'Description 1'),
      const News(title: 'Test News 2', description: 'Description 2'),
    ];

    when(mockNewsRepository.fetchNews()).thenAnswer((_) async => mockNews);

    // Override the provider with the mocked repository
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          newsApiServiceProvider.overrideWithValue(mockNewsRepository),
        ],
        child: const MaterialApp(
          home: NewsDetailsScreen(getIndex: 0), // Show details for the first news item
        ),
      ),
    );

    // Wait for the future to complete
    await tester.pumpAndSettle();

    // Assert
    expect(find.text('Test News 1'), findsOneWidget);
    expect(find.text('Description 1'), findsOneWidget);
  });

  testWidgets('NewsDetailsScreen shows error message when data fails to load', (WidgetTester tester) async {
    // Arrange
    final mockNewsRepository = MockNewsRepository();

    when(mockNewsRepository.fetchNews()).thenThrow(Exception('Failed to load news'));

    // Override the provider with the mocked repository
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          newsApiServiceProvider.overrideWithValue(mockNewsRepository),
        ],
        child: const MaterialApp(
          home: NewsDetailsScreen(getIndex: 0),
        ),
      ),
    );

    // Wait for the future to complete
    await tester.pumpAndSettle();

    // Assert
    expect(find.text('Failed to load news'), findsOneWidget);
  });
}