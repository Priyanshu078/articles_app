import 'package:articles_app_bharatnxt_assignment/articles_feature/domain/entities/article_entity.dart';
import 'package:articles_app_bharatnxt_assignment/articles_feature/domain/usecases/get_all_articles_usecase.dart';
import 'package:articles_app_bharatnxt_assignment/articles_feature/domain/usecases/get_favorite_articles_usecase.dart';
import 'package:articles_app_bharatnxt_assignment/core/enums/ui_state_enum.dart';
import 'package:flutter/material.dart';

class ArticlesViewModel extends ChangeNotifier {
  ArticlesViewModel(this._getAllArticlesUsecase, this._getFavoriteArticlesUsecase, {this.isFavorite = false}) {
    getArticles();
  }

  final GetAllArticlesUsecase _getAllArticlesUsecase;
  final GetFavoriteArticlesUsecase _getFavoriteArticlesUsecase;
  final bool isFavorite;

  final List<ArticleEntity> _articles = [];
  List<ArticleEntity> get articles => _articles;

  UIState _uiState = UIState.empty;
  UIState get uiState => _uiState;

  Future<void> getArticles({bool shouldNotify = false}) async {
    _articles.clear();
    _uiState = UIState.loading;
    if (shouldNotify) notifyListeners();
    List<ArticleEntity> response;
    if (isFavorite) {
      response = await _getFavoriteArticlesUsecase();
    } else {
      response = await _getAllArticlesUsecase();
    }
    if (response.isNotEmpty) {
      _articles.addAll(response);
    }
    _uiState = UIState.loaded;
    notifyListeners();
  }
}
