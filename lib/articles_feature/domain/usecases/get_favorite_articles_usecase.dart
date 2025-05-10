import 'package:articles_app_bharatnxt_assignment/articles_feature/domain/entities/article_entity.dart';
import 'package:articles_app_bharatnxt_assignment/articles_feature/domain/repositories/article_repository.dart';

class GetFavoriteArticlesUsecase {
  final ArticleRepository repository;

  GetFavoriteArticlesUsecase(this.repository);

  Future<List<ArticleEntity>> call() async {
    return await repository.getFavoriteArticles();
  }
}
