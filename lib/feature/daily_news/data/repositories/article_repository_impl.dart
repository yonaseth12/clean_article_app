import "package:clean_article_app/feature/daily_news/domain/repositories/article_repository.dart";
import "package:clean_article_app/core/resources/data_state.dart";
import "package:clean_article_app/feature/daily_news/data/models/article.dart";

class ArticleRepositoryImpl implements ArticleRepository {
  @override
  Future<DataState<List<ArticleModel>>> getNewsArticles() {

    throw UnimplementedError();
  }
}