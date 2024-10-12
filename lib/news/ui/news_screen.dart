
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/news/ui/news_list_widget.dart';
import 'package:news_app/news/ui/news_state.dart';
import 'package:news_app/routes/bottom_navigation/bottom_navigation_widget.dart';
import 'package:news_app/widgets/loading_widget.dart';
import 'package:news_app/widgets/news_app_bar.dart';

class NewsScreen extends ConsumerWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final getNews = ref.watch(newsProvider);

    return Scaffold(
      appBar: const NewsAppBar( title: 'Fetch News'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // News List
              getNews.when(
                data: (data) => NewsListWidget(
                  newsData: data,
                  onItemClick: (index) => context.pushNamed(
                    'newsDetails',
                    pathParameters: {'getIndex': index.toString()},
                  ),
                ),

                error: (error, stack) => const Center(child: Text('Error occurred')),

                loading: () => const LoadingWidget(),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavigationBarWidget(),
    );
  }
}