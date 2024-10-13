import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/database/database_service.dart';
import 'package:news_app/routes/routes.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await DatabaseService().init();  // Initialize your database service

  runApp( const ProviderScope( child:  NewsApp()));
}

class NewsApp extends ConsumerStatefulWidget{
  const NewsApp({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>  _NewAppState();
  
}

class _NewAppState extends ConsumerState<NewsApp> {
  final _observer = NavigatorObserver();

  BuildContext get appContext => _observer.navigator!.context;
  @override
  Widget build(BuildContext context) {
    final router = ref.watch(routerProvider(_observer));

    return MaterialApp.router(
      title: 'Flutter Demo',
      routerConfig: router,
    );
  }
}
