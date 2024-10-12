import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/api/api_endpoint.dart';
import 'package:news_app/news/model/news_model.dart';
import 'package:news_app/news/repository/news_repository.dart';
import 'news_mock_client.dart';

void main() {
  group('NewsRepository', () {
    late NewsMockClient mockClient;
    late NewsRepository repository;

    setUp(() {
      mockClient = NewsMockClient();
      repository = NewsRepository(client: mockClient);
    });

    test('fetchNews returns a list of News objects on successful response', () async {
      // Arrange: mock a successful response
      when(mockClient.get(Uri.parse(endPoint))).thenAnswer(
        (_) async => http.Response('''
        {
          "articles": [
            {"title": "News 1", "author": "Author 1", "content": "Content 1", "description": "Description 1"},
            {"title": "News 2", "author": "Author 2", "content": "Content 2", "description": "Description 2"}
          ]
        }
        ''', 200),
      );

      // Act: fetch news
      final newsList = await repository.fetchNews();

      // Assert: verify the result
      expect(newsList, isA<List<News>>());
      expect(newsList.length, equals(2));
      expect(newsList[0].title, 'News 1');
      expect(newsList[1].title, 'News 2');
    });

    test('fetchNews throws an exception on failed response', () async {
      // Arrange: mock a failed response
      when(mockClient.get(Uri.parse(endPoint)))
          .thenAnswer((_) async => http.Response('Error', 404));

      // Act & Assert: ensure an exception is thrown
      expect(() async => await repository.fetchNews(), throwsException);
    });

    test('fetchNews throws an exception on JSON decode error', () async {
      // Arrange: mock a response with invalid JSON
      when(mockClient.get(Uri.parse(endPoint)))
          .thenAnswer((_) async => http.Response('Invalid JSON', 200));

      // Act & Assert: ensure an exception is thrown
      expect(() async => await repository.fetchNews(), throwsException);
    });
  });
}