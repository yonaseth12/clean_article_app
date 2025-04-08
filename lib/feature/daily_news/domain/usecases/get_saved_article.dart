import "package:clean_article_app/core/usecases/usecase.dart";
import "package:clean_article_app/feature/daily_news/domain/entities/article.dart";
import "package:clean_article_app/feature/daily_news/domain/repositories/article_repository.dart";

class GetSavedArticleUseCase implements UseCase<List<ArticleEntity>, void> {
  
  final ArticleRepository _articleRepository;

  GetSavedArticleUseCase(this._articleRepository);

  @override
  Future<List<ArticleEntity>> call({void params}) {
    return _articleRepository.getSavedArticles();
  }
}