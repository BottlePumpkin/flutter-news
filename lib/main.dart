import 'package:flutter/material.dart';
import 'package:flutter_news/app/config/app_provider_config.dart';
import 'package:flutter_news/app/config/routes.dart';
import 'package:flutter_news/app/palette/network/http_client_impl.dart';
import 'package:flutter_news/app/palette/network/uri_extension.dart';
import 'package:flutter_news/data/api/story_api.dart';
import 'package:flutter_news/presentation/story/story_detail/story_detail_view.dart';
import 'package:flutter_news/presentation/story/story_main/story_main_view.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: AppProviderConfig.providers(),
      child: MaterialApp(
        title: 'flutter_story',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => StoryMainView(),
          storyDetail: (context) => const StoryDetailView(),


        },
      ),
    );
  }
}
