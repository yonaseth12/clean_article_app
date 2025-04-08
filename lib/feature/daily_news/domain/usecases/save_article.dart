import "package:clean_article_app/core/usecases/usecase.dart";
import "package:clean_article_app/feature/daily_news/domain/entities/article.dart";
import "package:clean_article_app/feature/daily_news/domain/repositories/article_repository.dart";

class SaveArticleUseCase implements UseCase<void, ArticleEntity> {
  
  final ArticleRepository _articleRepository;

  SaveArticleUseCase(this._articleRepository);

  @override
  Future<void> call({ArticleEntity ? params}) {
    return _articleRepository.saveArticle(params!);
  }
}