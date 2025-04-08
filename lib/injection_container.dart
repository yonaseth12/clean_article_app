import "package:clean_article_app/feature/daily_news/data/data_sources/app_database.dart";
import "package:clean_article_app/feature/daily_news/domain/usecases/get_article.dart";
import "package:clean_article_app/feature/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart";
import "package:get_it/get_it.dart";
import "package:dio/dio.dart";
import "package:clean_article_app/feature/daily_news/domain/repositories/article_repository.dart";
import "package:clean_article_app/feature/daily_news/data/repositories/article_repository_impl.dart";
import "package:clean_article_app/feature/daily_news/data/data_sources/remote/news_api_service.dart";

final sl = GetIt.instance;

Future<void> initializeDependencies() async {

  final database = await $FloorAppDatabase.databaseBuilder("app_database.db").build();
  sl.registerSingleton<AppDatabase>(database);

  //Dio
  sl.registerSingleton<Dio>(Dio());

  //Dependencies
  sl.registerSingleton<NewsApiService>(NewsApiService(sl()));

  sl.registerSingleton<ArticleRepository>(ArticleRepositoryImpl(sl()));

  //Usecases
  sl.registerSingleton<GetArticleUseCase>(GetArticleUseCase(sl()));

  //Blocs
  sl.registerFactory<RemoteArticleBloc>(
    () => RemoteArticleBloc(sl())
  );
}