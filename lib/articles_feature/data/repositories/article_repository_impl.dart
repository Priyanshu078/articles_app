import 'dart:convert';
import 'package:articles_app_bharatnxt_assignment/articles_feature/data/datasources/article_local_data_source.dart';
import 'package:articles_app_bharatnxt_assignment/articles_feature/data/datasources/article_remote_data_source.dart';
import 'package:articles_app_bharatnxt_assignment/articles_feature/data/models/article_model.dart';
import 'package:articles_app_bharatnxt_assignment/articles_feature/domain/entities/article_entity.dart';
import 'package:articles_app_bharatnxt_assignment/articles_feature/domain/repositories/article_repository.dart';
import 'package:articles_app_bharatnxt_assignment/core/constants/shared_prefs_constants.dart';
import 'package:articles_app_bharatnxt_assignment/core/errors/failure.dart';
import 'package:articles_app_bharatnxt_assignment/core/storage/shared_preferences_helper.dart';
import 'package:dartz/dartz.dart';

class ArticleRepositoryImpl implements ArticleRepository {
  final ArticleRemoteDataSource _remoteDataSource;
  final ArticleLocalDataSource _localDataSource;
  final SharedPreferencesHelper _sharedPreferencesHelper;
  ArticleRepositoryImpl(this._remoteDataSource, this._localDataSource, this._sharedPreferencesHelper);

  @override
  Future<Either<Failure, List<ArticleEntity>>> getAllArticles() async {
    final response = await _remoteDataSource.fetchArticles();
    return response.fold((failure) => Left(failure), (articles) => Right(articles.map((article) => article.toEntity()).toList()));
  }

  @override
  Future<Either<Failure, List<ArticleEntity>>> getFavoriteArticles() async {
    final response = await _localDataSource.fetchArticles();
    return response.fold((failure) => Left(failure), (articles) => Right(articles.map((article) => article.toEntity()).toList()));
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
    final response = await _localDataSource.fetchArticles();
    response.fold((failure) => Left(failure), (articles) async {
      int index = articles.indexWhere((article) => article.title == articleModel.title);
      if (index != -1) {
        articles.removeAt(index);
      }
      List<String> jsonList = articles.map((article) => jsonEncode(article.toJson())).toList();
      await _sharedPreferencesHelper.setStringList(SharedPrefsConstants.favoriteArticles, jsonList);
    });
  }
}
