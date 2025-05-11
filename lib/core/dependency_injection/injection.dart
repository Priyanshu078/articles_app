import 'package:articles_app_bharatnxt_assignment/articles_feature/data/datasources/article_local_data_source.dart';
import 'package:articles_app_bharatnxt_assignment/articles_feature/data/datasources/article_remote_data_source.dart';
import 'package:articles_app_bharatnxt_assignment/articles_feature/data/repositories/article_repository_impl.dart';
import 'package:articles_app_bharatnxt_assignment/articles_feature/domain/usecases/delete_favorite_article_usecase.dart';
import 'package:articles_app_bharatnxt_assignment/articles_feature/domain/usecases/get_all_articles_usecase.dart';
import 'package:articles_app_bharatnxt_assignment/articles_feature/domain/usecases/get_favorite_articles_usecase.dart';
import 'package:articles_app_bharatnxt_assignment/articles_feature/domain/usecases/save_favorite_article_usecase.dart';
import 'package:articles_app_bharatnxt_assignment/core/network/api_config.dart';
import 'package:articles_app_bharatnxt_assignment/core/storage/shared_preferences_helper.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

Future registerDependencies() async {
  final SharedPreferences sharedPrefs = await SharedPreferences.getInstance();

  // register dio instance
  getIt.registerLazySingleton<Dio>(() {
    final dio = Dio(BaseOptions(baseUrl: ApiConfig.baseUrl, contentType: 'application/json'));
    return dio;
  });

  // register Shared Peferences Instance
  getIt.registerLazySingleton<SharedPreferences>(() => sharedPrefs);

  getIt.registerLazySingleton<SharedPreferencesHelper>(() => SharedPreferencesHelper(getIt<SharedPreferences>()));

  // articles feature

  getIt.registerLazySingleton<ArticleRemoteDataSourceImpl>(() => ArticleRemoteDataSourceImpl(getIt<Dio>()));

  getIt.registerLazySingleton<ArticleLocalDataSourceImpl>(() => ArticleLocalDataSourceImpl(getIt<SharedPreferencesHelper>()));

  getIt.registerLazySingleton<ArticleRepositoryImpl>(
    () => ArticleRepositoryImpl(getIt<ArticleRemoteDataSourceImpl>(), getIt<ArticleLocalDataSourceImpl>(), getIt<SharedPreferencesHelper>()),
  );

  getIt.registerLazySingleton<GetAllArticlesUsecase>(() => GetAllArticlesUsecase(getIt<ArticleRepositoryImpl>()));

  getIt.registerLazySingleton<GetFavoriteArticlesUsecase>(() => GetFavoriteArticlesUsecase(getIt<ArticleRepositoryImpl>()));

  getIt.registerLazySingleton<SaveFavoriteArticleUsecase>(() => SaveFavoriteArticleUsecase(getIt<ArticleRepositoryImpl>()));

  getIt.registerLazySingleton<DeleteFavoriteArticleUsecase>(() => DeleteFavoriteArticleUsecase(getIt<ArticleRepositoryImpl>()));
}
