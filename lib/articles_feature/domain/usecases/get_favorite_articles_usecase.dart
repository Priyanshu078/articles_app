import 'package:articles_app_bharatnxt_assignment/articles_feature/domain/entities/article_entity.dart';
import 'package:articles_app_bharatnxt_assignment/articles_feature/domain/repositories/article_repository.dart';
import 'package:articles_app_bharatnxt_assignment/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

class GetFavoriteArticlesUsecase {
  final ArticleRepository repository;

  GetFavoriteArticlesUsecase(this.repository);

  Future<Either<Failure, List<ArticleEntity>>> call() async {
    return await repository.getFavoriteArticles();
  }
}
