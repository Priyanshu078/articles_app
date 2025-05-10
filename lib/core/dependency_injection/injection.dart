import 'package:articles_app_bharatnxt_assignment/articles_feature/data/datasources/article_local_data_source.dart';
import 'package:articles_app_bharatnxt_assignment/articles_feature/data/datasources/article_remote_data_source.dart';
import 'package:articles_app_bharatnxt_assignment/articles_feature/data/repositories/article_repository_impl.dart';
import 'package:articles_app_bharatnxt_assignment/articles_feature/domain/usecases/get_all_articles_usecase.dart';
import 'package:articles_app_bharatnxt_assignment/articles_feature/domain/usecases/get_favorite_articles_usecase.dart';
import 'package:articles_app_bharatnxt_assignment/articles_feature/presentation/viewmodels/articles_view_model.dart';
import 'package:articles_app_bharatnxt_assignment/core/network/api_config.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void registerDependencies() {
  // register dio instance
  getIt.registerLazySingleton<Dio>(() {
    final dio = Dio(BaseOptions(baseUrl: ApiConfig.baseUrl, contentType: 'application/json'));
    return dio;
  });

  // articles feature

  getIt.registerLazySingleton<ArticleRemoteDataSourceImpl>(() => ArticleRemoteDataSourceImpl(getIt<Dio>()));

  getIt.registerLazySingleton<ArticleLocalDataSourceImpl>(() => ArticleLocalDataSourceImpl());

  getIt.registerLazySingleton<ArticleRepositoryImpl>(
    () => ArticleRepositoryImpl(getIt<ArticleRemoteDataSourceImpl>(), getIt<ArticleLocalDataSourceImpl>()),
  );

  getIt.registerLazySingleton<GetAllArticlesUsecase>(() => GetAllArticlesUsecase(getIt<ArticleRepositoryImpl>()));

  getIt.registerLazySingleton<GetFavoriteArticlesUsecase>(() => GetFavoriteArticlesUsecase(getIt<ArticleRepositoryImpl>()));

  getIt.registerLazySingleton<ArticlesViewModel>(() => ArticlesViewModel(getIt<GetAllArticlesUsecase>(), getIt<GetFavoriteArticlesUsecase>()));
}
