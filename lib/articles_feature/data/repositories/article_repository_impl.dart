import 'package:articles_app_bharatnxt_assignment/articles_feature/data/datasources/article_remote_data_source.dart';
import 'package:articles_app_bharatnxt_assignment/articles_feature/domain/entities/article_entity.dart';
import 'package:articles_app_bharatnxt_assignment/articles_feature/domain/repositories/article_repository.dart';

class ArticleRepositoryImpl implements ArticleRepository {
  final ArticleRemoteDataSource _remoteDataSource;
  ArticleRepositoryImpl(this._remoteDataSource);

  @override
  Future<List<ArticleEntity>> getArticles() async {
    final response = await _remoteDataSource.fetchArticles();
    return response.map((article) => article.toEntity()).toList();
  }
}
