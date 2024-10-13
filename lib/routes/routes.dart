import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/news/ui/news_screen.dart';
import 'package:news_app/news_details/news_details.dart';
import 'package:news_app/profile/profile_screen.dart';
import 'package:news_app/routes/news_app_routes.dart';
import 'package:news_app/saved_news/saved_news_screen.dart';

class RouteLoggerObserver extends NavigatorObserver {
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPush(route, previousRoute);
    if (route is MaterialPageRoute) {
      print('Navigated to: ${route.settings.name}');
    }
  }
}

// GoRouter configuration
//!! Adding the NavigatorObserver to log my route movement
final routerProvider = Provider.family<GoRouter, NavigatorObserver>(
  (ref, observer) {
    return GoRouter(
      initialLocation: NewsAppRoutes.news.path,
      observers: [observer, RouteLoggerObserver()],
      routes: <RouteBase>[
        
        GoRoute(
          path: '/',
          builder: (context, state) => const NewsScreen(),
        ),

        GoRoute(
          path: NewsAppRoutes.news.path,
          builder: (context, state) => const NewsScreen(),
        ),
        
        GoRoute(
            path: NewsAppRoutes.newsDetails.path,
            name: 'newsDetails',
            builder: (context, state) {
              return NewsDetailsScreen(
                getIndex: int.parse(state.pathParameters['getIndex'] ?? ''),
              );
            }),

        GoRoute(path: NewsAppRoutes.savedNews.path,
          builder: (context, state) => const SavedNewsScreen(),
        ),

        GoRoute(path: NewsAppRoutes.profile.path,
          builder: (context, state) => const ProfileScreen(),
        )

      ],
    );
  },
);
