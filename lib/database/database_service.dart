import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:news_app/news/model/news_model.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseService {

  static final DatabaseService _instance = DatabaseService._internal();
  Box<News>? _box;

  DatabaseService._internal();

  factory DatabaseService() => _instance;

  Future<void> init() async {
    if (kIsWeb) {
      // For web, initialize Hive with a default storage directory
      Hive.init('');
    } else {
      final dir = await getApplicationDocumentsDirectory();;
      Hive.init(dir.path);
    }

    Hive.registerAdapter(NewsAdapter());
    // Open a box to store your news
    _box = await Hive.openBox('savedNews');
  }

  Future<void> saveNews(News news) async {
    await _box?.add(news); // Store News object directly
  }

  Future<List<News>> getSavedNews() async {
    return _box?.values.toList() ?? []; // Return a list of News objects
  }
}