
import 'package:flutter/material.dart';
import 'package:news_app/news/ui/news_item_widget.dart';

class NewsListWidget extends StatelessWidget {
  final List<dynamic> newsData;
  final Function(int) onItemClick;

  const NewsListWidget({
    super.key,
    required this.newsData,
    required this.onItemClick,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: newsData.length,
      itemBuilder: (context, index) {
        return NewsItemWidget(
          newsItem: newsData[index],
          onTap: () => onItemClick(index),
        );
      },
    );
  }
}