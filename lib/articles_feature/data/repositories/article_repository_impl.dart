import 'package:articles_app_bharatnxt_assignment/articles_feature/data/datasources/article_local_data_source.dart';
import 'package:articles_app_bharatnxt_assignment/articles_feature/data/datasources/article_remote_data_source.dart';
import 'package:articles_app_bharatnxt_assignment/articles_feature/domain/entities/article_entity.dart';
import 'package:articles_app_bharatnxt_assignment/articles_feature/domain/repositories/article_repository.dart';

class ArticleRepositoryImpl implements ArticleRepository {
  final ArticleRemoteDataSource _remoteDataSource;
  final ArticleLocalDataSource _localDataSource;
  ArticleRepositoryImpl(this._remoteDataSource, this._localDataSource);

  @override
  Future<List<ArticleEntity>> getAllArticles() async {
    final response = await _remoteDataSource.fetchArticles();
    return response.map((article) => article.toEntity()).toList();
  }

  @override
  Future<List<ArticleEntity>> getFavoriteArticles() async {
    final response = await _localDataSource.fetchArticles();
    return response.map((article) => article.toEntity()).toList();
  }
}
