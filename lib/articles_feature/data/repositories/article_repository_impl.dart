import 'dart:convert';
import 'package:articles_app_bharatnxt_assignment/articles_feature/data/datasources/article_local_data_source.dart';
import 'package:articles_app_bharatnxt_assignment/articles_feature/data/datasources/article_remote_data_source.dart';
import 'package:articles_app_bharatnxt_assignment/articles_feature/data/models/article_model.dart';
import 'package:articles_app_bharatnxt_assignment/articles_feature/domain/entities/article_entity.dart';
import 'package:articles_app_bharatnxt_assignment/articles_feature/domain/repositories/article_repository.dart';
import 'package:articles_app_bharatnxt_assignment/core/constants/shared_prefs_constants.dart';
import 'package:articles_app_bharatnxt_assignment/core/storage/shared_preferences_helper.dart';

class ArticleRepositoryImpl implements ArticleRepository {
  final ArticleRemoteDataSource _remoteDataSource;
  final ArticleLocalDataSource _localDataSource;
  final SharedPreferencesHelper _sharedPreferencesHelper;
  ArticleRepositoryImpl(this._remoteDataSource, this._localDataSource, this._sharedPreferencesHelper);

  @override
  Future<List<ArticleEntity>> getAllArticles() async {
    final response = await _remoteDataSource.fetchArticles();
    return response.map((article) => article.toEntity()).toList();
  }

  @override
  Future<List<ArticleEntity>> getFavoriteArticles() async {
    final response = _localDataSource.fetchArticles();
    return response.map((article) => article.toEntity()).toList();
  }

  @override
  Future<void> saveFavoriteArticle(ArticleEntity articleEntity) async {
    final articleModel = ArticleModel(title: articleEntity.title, body: articleEntity.body, isFavorite: articleEntity.isFavorite);
    String article = jsonEncode(articleModel.toJson());
    await _sharedPreferencesHelper.saveFavoriteArticles(article);
  }

  @override
  Future<void> deleteFavoriteArticle(ArticleEntity articleEntity) async {
    final articleModel = ArticleModel(title: articleEntity.title, body: articleEntity.body, isFavorite: articleEntity.isFavorite);
    final favoriteArticleList = _localDataSource.fetchArticles();
    int index = favoriteArticleList.indexWhere((article) => article.title == articleModel.title);
    if (index != -1) {
      favoriteArticleList.removeAt(index);
    }
    List<String> jsonList = favoriteArticleList.map((article) => jsonEncode(article.toJson())).toList();
    await _sharedPreferencesHelper.setStringList(SharedPrefsConstants.favoriteArticles, jsonList);
  }
}
