
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/news/repository/news_repository.dart';

final newsProvider = FutureProvider((ref) async {
  return ref.watch(newsApiServiceProvider).fetchNews();
});
