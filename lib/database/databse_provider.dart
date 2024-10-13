// lib/providers/database_service_provider.dart

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/database/database_service.dart';

final databaseServiceProvider = Provider<DatabaseService>((ref) {
  return DatabaseService(); // Return a new instance of DatabaseService
});