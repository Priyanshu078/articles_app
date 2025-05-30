import 'package:articles_app_bharatnxt_assignment/articles_feature/domain/usecases/delete_favorite_article_usecase.dart';
import 'package:articles_app_bharatnxt_assignment/articles_feature/domain/usecases/get_all_articles_usecase.dart';
import 'package:articles_app_bharatnxt_assignment/articles_feature/domain/usecases/get_favorite_articles_usecase.dart';
import 'package:articles_app_bharatnxt_assignment/articles_feature/domain/usecases/save_favorite_article_usecase.dart';
import 'package:articles_app_bharatnxt_assignment/articles_feature/presentation/screens/article_list_screen.dart';
import 'package:articles_app_bharatnxt_assignment/articles_feature/presentation/viewmodels/articles_view_model.dart';
import 'package:articles_app_bharatnxt_assignment/core/dependency_injection/injection.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await registerDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Articles App',
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple)),
      home: ChangeNotifierProvider(
        create:
            (context) => ArticlesViewModel(
              getIt<GetAllArticlesUsecase>(),
              getIt<GetFavoriteArticlesUsecase>(),
              getIt<SaveFavoriteArticleUsecase>(),
              getIt<DeleteFavoriteArticleUsecase>(),
            ),
        child: ArticleListScreen(),
      ),
    );
  }
}
