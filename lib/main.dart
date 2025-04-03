import "package:clean_article_app/feature/daily_news/presentation/bloc/article/remote/remote_article_event.dart";
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import "injection_container.dart";
import "package:clean_article_app/feature/daily_news/presentation/pages/home/daily_news.dart";
import "package:clean_article_app/config/theme/app_themes.dart";
import "package:clean_article_app/feature/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart";

void main() async {
  await dotenv.load(fileName: ".env");
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return BlocProvider<RemoteArticleBloc>(
      create: (context) => sl()..add(const GetArticles()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: theme(),
        home: DailyNews()
      ),
    );
  }
}
