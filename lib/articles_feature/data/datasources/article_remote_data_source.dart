import 'package:articles_app_bharatnxt_assignment/articles_feature/data/constants/api_endpoints.dart';
import 'package:articles_app_bharatnxt_assignment/articles_feature/data/models/article_model.dart';
import 'package:articles_app_bharatnxt_assignment/core/constants/app_strings.dart';
import 'package:articles_app_bharatnxt_assignment/core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

abstract class ArticleRemoteDataSource {
  Future<Either<Failure, List<ArticleModel>>> fetchArticles();
}

class ArticleRemoteDataSourceImpl implements ArticleRemoteDataSource {
  final Dio dio;
  ArticleRemoteDataSourceImpl(this.dio);

  @override
  Future<Either<Failure, List<ArticleModel>>> fetchArticles() async {
    try {
      final response = await dio.get(ApiEndpoints.articles);
      if (response.statusCode == 200) {
        List articleList = response.data;
        return Right(articleList.map((article) => ArticleModel.fromJson(article)).toList());
      } else {
        return Left(ApiError("${response.statusCode} status Code, ${response.statusMessage}"));
      }
    } on DioException catch (_) {
      return Left(NetworkError(AppStrings.connectionError));
    } catch (e) {
      return Left(NetworkError(AppStrings.unexpectedError));
    }
  }
}
