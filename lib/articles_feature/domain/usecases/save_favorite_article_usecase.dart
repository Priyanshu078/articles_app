import 'package:articles_app_bharatnxt_assignment/articles_feature/domain/entities/article_entity.dart';
import 'package:articles_app_bharatnxt_assignment/articles_feature/domain/repositories/article_repository.dart';

class SaveFavoriteArticleUsecase {
  final ArticleRepository repository;

  SaveFavoriteArticleUsecase(this.repository);

  Future<void> call(ArticleEntity article) async {
    await repository.saveFavoriteArticle(article);
  }
}
