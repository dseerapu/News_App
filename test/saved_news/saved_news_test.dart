import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/news/model/news_model.dart';
import 'package:news_app/saved_news/saved_news_provider.dart';
import 'package:news_app/saved_news/saved_news_screen.dart';

void main() {
  late Future<List<News>> Function() mockFutureFunction;

  setUp(() {
    mockFutureFunction = () => Future.value([]);
  });

  Widget createWidgetUnderTest() {
    return ProviderScope(
      overrides: [
        savedNewsProvider.overrideWith((ref) => mockFutureFunction()),
      ],
      child: const MaterialApp(
        home: SavedNewsScreen(),
      ),
    );
  }

  group('SavedNewsScreen', () {

    testWidgets('displays error message when there is an error', (WidgetTester tester) async {
      mockFutureFunction = () => Future.error('Error loading saved news');

      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pumpAndSettle();

      expect(find.text('Error: Error loading saved news'), findsOneWidget);
    });

    testWidgets('displays "No saved news." when the list is empty', (WidgetTester tester) async {
      mockFutureFunction = () => Future.value([]);

      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pumpAndSettle();

      expect(find.text('No saved news.'), findsOneWidget);
    });

    testWidgets('displays a list of saved news when data is available', (WidgetTester tester)
     async {
      final mockNewsList = [
        const News(
          title: 'Test News 1',
          description: 'Test Description 1',
          urlToImage: 'https://via.placeholder.com/150',
        ),
        const News(
          title: 'Test News 2',
          description: 'Test Description 2',
          urlToImage: 'https://via.placeholder.com/150',
        ),
      ];

      mockFutureFunction = () => Future.value(mockNewsList);

      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pumpAndSettle();

      expect(find.text('Test News 1'), findsOneWidget);
      expect(find.text('Test Description 1'), findsOneWidget);
      expect(find.text('Test News 2'), findsOneWidget);
      expect(find.text('Test Description 2'), findsOneWidget);
      expect(find.byKey(const ValueKey('placeholderAssetImage')), findsNWidgets(2));
    });

    testWidgets('displays default values when news items have null fields', (WidgetTester tester) async {
      final mockNewsList = [
        News(
          title: null,
          description: null,
          urlToImage: null,
        ),
      ];

      mockFutureFunction = () => Future.value(mockNewsList);

      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pumpAndSettle();

      expect(find.text('No Title'), findsOneWidget);
      expect(find.text('No Description'), findsOneWidget);
      expect(find.byKey(const ValueKey('placeholderAssetImage')), findsOneWidget); // Should use default image URL
    });
  });
}