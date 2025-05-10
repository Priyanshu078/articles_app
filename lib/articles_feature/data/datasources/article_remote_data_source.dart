import 'package:articles_app_bharatnxt_assignment/articles_feature/data/constants/api_endpoints.dart';
import 'package:articles_app_bharatnxt_assignment/articles_feature/data/models/article_model.dart';
import 'package:dio/dio.dart';

abstract class ArticleRemoteDataSource {
  Future<List<ArticleModel>> fetchArticles();
}

class ArticleRemoteDataSourceImpl implements ArticleRemoteDataSource {
  final Dio dio;
  ArticleRemoteDataSourceImpl(this.dio);

  @override
  Future<List<ArticleModel>> fetchArticles() async {
    final response = await dio.get(ApiEndpoints.articles);
    if (response.statusCode == 200) {
      final articleList = response.data;
      return articleList.map((article) => ArticleModel.fromJson(article)).toList();
    } else {
      return [];
    }
  }
}
