import 'dart:convert';
import 'package:articles_app_bharatnxt_assignment/articles_feature/data/models/article_model.dart';
import 'package:articles_app_bharatnxt_assignment/core/constants/shared_prefs_constants.dart';
import 'package:articles_app_bharatnxt_assignment/core/storage/shared_preferences_helper.dart';

abstract class ArticleLocalDataSource {
  List<ArticleModel> fetchArticles();
}

class ArticleLocalDataSourceImpl implements ArticleLocalDataSource {
  ArticleLocalDataSourceImpl(this._sharedPreferencesHelper);

  final SharedPreferencesHelper _sharedPreferencesHelper;

  @override
  List<ArticleModel> fetchArticles() {
    List<String> savedFavArticles = _sharedPreferencesHelper.getStringList(SharedPrefsConstants.favoriteArticles);
    return savedFavArticles.map((article) => ArticleModel.fromJson(jsonDecode(article))).toList();
  }
}
