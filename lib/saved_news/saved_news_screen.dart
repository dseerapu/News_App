import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/routes/bottom_navigation/bottom_navigation_widget.dart';
import 'package:news_app/saved_news/saved_news_provider.dart';
import 'package:news_app/widgets/loading_widget.dart';// Import the provider

class SavedNewsScreen extends ConsumerWidget {
  const SavedNewsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch the savedNewsProvider for changes
    final savedNews = ref.watch(savedNewsProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Saved News')),
      body: savedNews.when(
        data: (newsList) {
          if (newsList.isEmpty) {
            return const Center(child: Text('No saved news.'));
          }

          return ListView.builder(
            itemCount: newsList.length,
            itemBuilder: (context, index) {
              final news = newsList[index];
              return ListTile(
                leading: Image.network(
                news.urlToImage ?? 'assets/placeholder.png', // Default image URL
                errorBuilder: (context, error, stackTrace) {
                  return Image.asset('assets/placeholder.png',  key: const ValueKey('placeholderAssetImage'),); // Fallback image on error
                },
              ),
                title: Text(news.title ?? 'No Title'),
                subtitle: Text(news.description ?? 'No Description'),
              );
            },
          );
        },
        loading: () => const LoadingWidget(),
        error: (error, stackTrace) => Center(child: Text('Error: $error')),
      ),
      bottomNavigationBar: const BottomNavigationBarWidget(),
    );
  }
}