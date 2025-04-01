import "package:clean_article_app/core/resources/data_state.dart";
import "package:clean_article_app/feature/daily_news/domain/entities/article.dart";

abstract class ArticleRepository {

  Future<DataState<List<ArticleEntity>>> getNewsArticles();

}