import 'dart:convert';
import 'package:articles_app_bharatnxt_assignment/articles_feature/data/models/article_model.dart';
import 'package:articles_app_bharatnxt_assignment/core/constants/app_strings.dart';
import 'package:articles_app_bharatnxt_assignment/core/constants/shared_prefs_constants.dart';
import 'package:articles_app_bharatnxt_assignment/core/errors/failure.dart';
import 'package:articles_app_bharatnxt_assignment/core/storage/shared_preferences_helper.dart';
import 'package:dartz/dartz.dart';

abstract class ArticleLocalDataSource {
  Future<Either<Failure, List<ArticleModel>>> fetchArticles();
}

class ArticleLocalDataSourceImpl implements ArticleLocalDataSource {
  ArticleLocalDataSourceImpl(this._sharedPreferencesHelper);

  final SharedPreferencesHelper _sharedPreferencesHelper;

  @override
  Future<Either<Failure, List<ArticleModel>>> fetchArticles() async {
    try {
      List<String> savedFavArticles = _sharedPreferencesHelper.getStringList(SharedPrefsConstants.favoriteArticles);
      return Right(savedFavArticles.map((article) => ArticleModel.fromJson(jsonDecode(article))).toList());
    } catch (e) {
      return Left(CacheError(AppStrings.favArticlesErrorMessage));
    }
  }
}
