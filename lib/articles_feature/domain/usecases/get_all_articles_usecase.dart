import 'package:articles_app_bharatnxt_assignment/articles_feature/domain/entities/article_entity.dart';
import 'package:articles_app_bharatnxt_assignment/articles_feature/domain/repositories/article_repository.dart';
import 'package:articles_app_bharatnxt_assignment/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

class GetAllArticlesUsecase {
  final ArticleRepository repository;

  GetAllArticlesUsecase(this.repository);

  Future<Either<Failure, List<ArticleEntity>>> call() async {
    return await repository.getAllArticles();
  }
}
