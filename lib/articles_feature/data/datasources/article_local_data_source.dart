import 'package:articles_app_bharatnxt_assignment/articles_feature/data/constants/api_endpoints.dart';
import 'package:articles_app_bharatnxt_assignment/articles_feature/data/models/article_model.dart';
import 'package:dio/dio.dart';

abstract class ArticleLocalDataSource {
  Future<List<ArticleModel>> fetchArticles();
}

class ArticleLocalDataSourceImpl implements ArticleLocalDataSource {
  ArticleLocalDataSourceImpl();

  @override
  Future<List<ArticleModel>> fetchArticles() async {
    // final response = await dio.get(ApiEndpoints.articles);
    // if (response.statusCode == 200) {
    //   final articleList = response.data;
    //   return articleList.map((article) => ArticleModel.fromJson(article)).toList();
    // } else {
      return [];
    // }
  }
}
