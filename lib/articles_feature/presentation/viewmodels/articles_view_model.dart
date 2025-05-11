import 'package:articles_app_bharatnxt_assignment/articles_feature/domain/entities/article_entity.dart';
import 'package:articles_app_bharatnxt_assignment/articles_feature/domain/usecases/delete_favorite_article_usecase.dart';
import 'package:articles_app_bharatnxt_assignment/articles_feature/domain/usecases/get_all_articles_usecase.dart';
import 'package:articles_app_bharatnxt_assignment/articles_feature/domain/usecases/get_favorite_articles_usecase.dart';
import 'package:articles_app_bharatnxt_assignment/articles_feature/domain/usecases/save_favorite_article_usecase.dart';
import 'package:articles_app_bharatnxt_assignment/core/enums/ui_state_enum.dart';
import 'package:flutter/material.dart';

class ArticlesViewModel extends ChangeNotifier {
  ArticlesViewModel(
    this._getAllArticlesUsecase,
    this._getFavoriteArticlesUsecase,
    this._saveFavoriteArticleUsecase,
    this._deleteFavoriteArticleUsecase,
  ) {
    getAllArticles();
    getFavoriteArticles();
  }

  final GetAllArticlesUsecase _getAllArticlesUsecase;
  final GetFavoriteArticlesUsecase _getFavoriteArticlesUsecase;
  final SaveFavoriteArticleUsecase _saveFavoriteArticleUsecase;
  final DeleteFavoriteArticleUsecase _deleteFavoriteArticleUsecase;

  final List<ArticleEntity> _allArticles = [];
  List<ArticleEntity> get allArticles => _allArticles;

  final List<ArticleEntity> _favoriteArticles = [];
  List<ArticleEntity> get favoriteArticles => _favoriteArticles;

  UIState _uiState = UIState.empty;
  UIState get uiState => _uiState;

  UIState _favArticlesUIState = UIState.empty;
  UIState get favArticlesUIState => _favArticlesUIState;

  Future<void> getAllArticles({bool shouldNotify = false}) async {
    _allArticles.clear();
    _uiState = UIState.loading;
    if (shouldNotify) notifyListeners();
    List<ArticleEntity> response = await _getAllArticlesUsecase();
    if (response.isNotEmpty) {
      _allArticles.addAll(response);
    }
    _uiState = UIState.loaded;
    notifyListeners();
  }

  Future<void> getFavoriteArticles({bool shouldNotify = false}) async {
    _favoriteArticles.clear();
    _favArticlesUIState = UIState.loading;
    if (shouldNotify) notifyListeners();
    List<ArticleEntity> response = await _getFavoriteArticlesUsecase();
    if (response.isNotEmpty) {
      _favoriteArticles.addAll(response);
    }
    _favArticlesUIState = UIState.loaded;
    notifyListeners();
  }

  Future<void> markFavorite(int index) async {
    final article = _allArticles[index];
    final updatedArticle = article.copyWith(isFavorite: !article.isFavorite);
    _allArticles[index] = updatedArticle;
    notifyListeners();
    if (!_favoriteArticles.contains(updatedArticle) && updatedArticle.isFavorite) {
      _favoriteArticles.add(updatedArticle);
      await _saveFavoriteArticleUsecase(updatedArticle);
    } else if (!updatedArticle.isFavorite) {
      _favoriteArticles.remove(updatedArticle);
      await _deleteFavoriteArticleUsecase(updatedArticle);
    }
  }
}
