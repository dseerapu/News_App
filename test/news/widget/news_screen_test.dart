import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/news/model/news_model.dart';
import 'package:news_app/news/repository/news_repository.dart';
import 'package:news_app/news/ui/news_screen.dart';

// Generate mocks
@GenerateMocks([NewsRepository, GoRouter])
import 'news_screen_test.mocks.dart';

void main() {
  late MockNewsRepository mockNewsRepository;

  setUp(() {
    mockNewsRepository = MockNewsRepository();
  });

  testWidgets('NewsScreen displays loading widget when fetching news', (WidgetTester tester) async {
    // Arrange
    final completer = Completer<List<News>>();
    when(mockNewsRepository.fetchNews()).thenAnswer((_) => completer.future);

    // Act
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          newsApiServiceProvider.overrideWithValue(mockNewsRepository),
        ],
        child: const MaterialApp(
          home: NewsScreen(),
        ),
      ),
    );

    // Assert - Check for loading state
    expect(find.byType(CircularProgressIndicator), findsOneWidget);

    // Complete the future
    completer.complete([]);
    
    // Wait for all animations to complete
    await tester.pumpAndSettle();
  });

  testWidgets('NewsScreen displays error message when fetch fails', (WidgetTester tester) async {
    // Arrange
    when(mockNewsRepository.fetchNews()).thenThrow(Exception('Failed to load news'));

    // Act
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          newsApiServiceProvider.overrideWithValue(mockNewsRepository),
        ],
        child: const MaterialApp(
          home: NewsScreen(),
        ),
      ),
    );

    // Wait for the future to complete
    await tester.pumpAndSettle();

    // Assert
    expect(find.text('Error occurred'), findsOneWidget);
  });
}