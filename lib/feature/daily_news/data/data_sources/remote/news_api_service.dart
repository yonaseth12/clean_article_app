import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'package:clean_article_app/core/utils/constants.dart';
import 'package:clean_article_app/feature/daily_news/data/models/article.dart';

part 'news_api_service.g.dart';

@RestApi(baseUrl: Constants.newsAPIBaseUrl)
abstract class NewsApiService {
  factory NewsApiService(Dio dio) = _NewsApiService;

  @GET("/top-headlines")
  Future<HttpResponse<List<ArticleModel>>> getNewsArticles({
    @Query("apikey") String ? apikey,
    @Query("country") String ? country,
    @Query("category") String ? category,
  });
}