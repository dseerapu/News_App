import 'dart:convert'; // For jsonDecode
import 'package:http/http.dart' as http; // For making HTTP requests
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/api/api_endpoint.dart';
import 'package:news_app/news/model/news_model.dart'; // For Riverpod dependency injection

class NewsRepository {
  final http.Client client;

  // Constructor with optional client injection for testability
  NewsRepository({http.Client? client}) : client = client ?? http.Client(); 

  // Fetch news from API
  Future<List<News>> fetchNews() async {

    // Use the injected client to make the request
    final response = await client.get(Uri.parse(endPoint));

    // If request is successful, parse the news articles
    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['articles'];
      
      // Map each article to a News model object
      return data.map((e) => News.fromJson(e)).toList();
    } else {
      // If the server didn't return a 200 OK response, throw an exception
      throw Exception('Failed to load news');
    }
  }
}

// Define the News API service provider using Riverpod
final newsApiServiceProvider = Provider<NewsRepository>((ref) {
  return NewsRepository(client: http.Client());
});