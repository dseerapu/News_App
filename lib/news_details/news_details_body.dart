import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/api/api_endpoint.dart';
import 'package:news_app/news/model/news_model.dart';

class NewsDetailsBody extends StatelessWidget {
  final News news;

  const NewsDetailsBody({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.network(
          news.urlToImage ?? defaultImageURL,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
              // Display an error widget if the image fails to load
              return const Icon(
                Icons.error,
                size: 100,
                color: Colors.red,
              );
            }
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                news.title ?? "No Title",
                style: GoogleFonts.spaceGrotesk(
                  fontSize: 26,
                  height: 1,
                  fontWeight: FontWeight.bold,
                ),
              ), 
              const Gap(12),
              Text(news.description ?? "No Description"),
              const Gap(8),
              Text(news.content ?? "No Content"),
            ],
          ),
        )
      ],
    );
  }
}