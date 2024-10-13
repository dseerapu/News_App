import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/database/database_service.dart';
import 'package:news_app/news/model/news_model.dart';

final savedNewsProvider = FutureProvider<List<News>>((ref) async {
  final dbService = DatabaseService();
  return dbService.getSavedNews();
});