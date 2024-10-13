import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NewsItemWidget extends StatelessWidget {
  final dynamic newsItem;
  final Function onTap;
  final Function onSaveNews;

  const NewsItemWidget({
    super.key,
    required this.newsItem,
    required this.onTap,
    required this.onSaveNews,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Image.network(
                  newsItem.urlToImage ??
                      "https://www.outsystems.com/Forge_CW/_image.aspx/Q8LvY--6WakOw9afDCuuGfdpOypWf7wwQViUz4gj-GY=/newsapi-2023-01-04%2000-00-00-2023-08-11%2005-48-06",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [

                    Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Title text in an Expanded widget to allow multi-line wrapping
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              newsItem.title ?? 'No Title',
                              maxLines: null, // Allows text to wrap into multiple lines
                              style: GoogleFonts.spaceGrotesk(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),

                      // Bookmark icon, aligned to the end
                      IconButton(
                        icon: const Icon(Icons.bookmark_outline),
                        onPressed: () {
                          onSaveNews(newsItem);
                          ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Saved "${newsItem.title}"')),
                          );
                        },
                      ),
                    ],
                  )
                    ,
                    Text(
                      '${newsItem.description}',
                      style: TextStyle(
                        fontSize: 11,
                        color: Colors.grey.shade600,
                      ),
                      maxLines: 3,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}