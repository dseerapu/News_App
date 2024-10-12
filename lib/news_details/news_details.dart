
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/news/ui/news_state.dart';
import 'package:news_app/news_details/news_details_body.dart';
import 'package:news_app/widgets/error_widget.dart';
import 'package:news_app/widgets/loading_widget.dart';
import 'package:news_app/widgets/news_app_bar.dart';

class NewsDetailsScreen extends ConsumerWidget {
  const NewsDetailsScreen({super.key, required this.getIndex});

  final int getIndex;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    
    // ** get the news details from the getNews provider
    final newsDetails = ref.watch(newsProvider);

    return Scaffold(
      appBar: const NewsAppBar(title: 'News Details',centerTitle: true, showBackButton: true,), // app bar

      body: newsDetails.when(

        data: (data) => NewsDetailsBody(news: data[getIndex]),

        error: (error, stack) => const ErrorTextWidget(message: 'Failed to load news'),

        loading: () => const LoadingWidget(),

      ));
  }
}
