import "package:clean_article_app/feature/daily_news/domain/repositories/article_repository.dart";
import "package:clean_article_app/feature/daily_news/data/data_sources/remote/news_api_service.dart";
import "package:clean_article_app/core/resources/data_state.dart";
import "package:clean_article_app/feature/daily_news/data/models/article.dart";
import "package:clean_article_app/config/environment_config.dart";
import "package:clean_article_app/core/utils/constants.dart";
import "dart:io";
import "package:dio/dio.dart";

class ArticleRepositoryImpl implements ArticleRepository {
  
  final NewsApiService _newsApiService;
  ArticleRepositoryImpl(this._newsApiService);

  @override
  Future<DataState<List<ArticleModel>>> getNewsArticles() async {
    try {
      final httpResponse = await _newsApiService.getNewsArticles(
        apikey: Environment.apiKey,
        country: Constants.default_country,
        category: Constants.default_article_category
      );

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else {
          return DataFailed(
            DioError(
              error: httpResponse.response.statusMessage,
              response: httpResponse.response,
              type: DioErrorType.connectionError,
              requestOptions: httpResponse.response.requestOptions,
            )
          );
      }

    } on DioError catch (e) {
      return DataFailed(e);
    }

  }
}