import 'package:clean_article_app/feature/daily_news/domain/entities/article.dart';
import 'package:floor/floor.dart';

@Entity(tableName: 'article', primaryKeys: ['id'])
class ArticleModel extends ArticleEntity{
    const ArticleModel({
      int ? id,
      String ? author,
      String ? title,
      String ? description,
      String ? url,
      String ? urlToImage,
      String ? publishedAt,
      String ? content,  
    }) : super(
      id: id,
      author: author,
      title: title,
      description: description,
      url: url,
      urlToImage: urlToImage,
      publishedAt: publishedAt,
      content: content,
    );

    factory ArticleModel.fromJson(Map <String, dynamic> map){
      return ArticleModel(
        author: map['author'] ?? "",
        title: map['title'] ?? "",
        description: map['description'] ?? "",
        url: map['url'] ?? "",
        urlToImage: map['urlToImage'] ?? "",
        publishedAt: map['publishedAt'] ?? "",
        content: map['content'] ?? "",
      );
    }

    factory ArticleModel.fromEntity(ArticleEntity entity) {
      return ArticleModel(
        id: entity.id,
        author: entity.author,
        title: entity.title,
        description: entity.description,
        url: entity.url,
        urlToImage: entity.urlToImage,
        publishedAt: entity.publishedAt,
        content: entity.content,
      );
    }
}

class ArticleResponseModel {
  List<ArticleModel> articles;

  ArticleResponseModel({required this.articles});

  factory ArticleResponseModel.fromJson(Map<String, dynamic> articleResponseData) {
    return ArticleResponseModel(articles: (
        (articleResponseData['articles'] ?? []) as 
        List<dynamic>).map(
          (dynamic article) => ArticleModel.fromJson(article)
        ).toList()
      );
  }
}

