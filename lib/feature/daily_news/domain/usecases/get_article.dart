import "package:clean_article_app/core/usecases/usecase.dart";
import "package:clean_article_app/core/resources/data_state.dart";
import "package:clean_article_app/feature/daily_news/domain/entities/article.dart";
import "package:clean_article_app/feature/daily_news/domain/repositories/article_repository.dart";

class GetArticleUseCase implements UseCase<DataState<List<ArticleEntity>>, void> {
  
  final ArticleRepository _articleRepository;

  GetArticleUseCase(this._articleRepository);

  @override
  Future<DataState<List<ArticleEntity>>> call({void params}) {
    return _articleRepository.getNewsArticles();
  }
}