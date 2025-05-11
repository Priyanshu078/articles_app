import 'package:articles_app_bharatnxt_assignment/articles_feature/domain/entities/article_entity.dart';

abstract class ArticleRepository {
  Future<List<ArticleEntity>> getAllArticles();
  Future<List<ArticleEntity>> getFavoriteArticles();
  Future<void> saveFavoriteArticle(ArticleEntity articleEntity);
  Future<void> deleteFavoriteArticle(ArticleEntity articleEntity);
}
