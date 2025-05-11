import 'package:articles_app_bharatnxt_assignment/articles_feature/domain/entities/article_entity.dart';
import 'package:articles_app_bharatnxt_assignment/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

abstract class ArticleRepository {
  Future<Either<Failure, List<ArticleEntity>>> getAllArticles();
  Future<Either<Failure, List<ArticleEntity>>> getFavoriteArticles();
  Future<void> saveFavoriteArticle(ArticleEntity articleEntity);
  Future<void> deleteFavoriteArticle(ArticleEntity articleEntity);
}
