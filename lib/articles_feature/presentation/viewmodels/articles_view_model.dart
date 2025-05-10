import 'package:articles_app_bharatnxt_assignment/articles_feature/domain/usecases/get_articles_usecase.dart';
import 'package:flutter/material.dart';

class ArticlesViewModel extends ChangeNotifier {
  final GetArticlesUsecase _getArticlesUsecase;
  ArticlesViewModel(this._getArticlesUsecase);
}
