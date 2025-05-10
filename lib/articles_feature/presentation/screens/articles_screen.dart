import 'package:articles_app_bharatnxt_assignment/articles_feature/domain/usecases/get_all_articles_usecase.dart';
import 'package:articles_app_bharatnxt_assignment/articles_feature/domain/usecases/get_favorite_articles_usecase.dart';
import 'package:articles_app_bharatnxt_assignment/articles_feature/presentation/viewmodels/articles_view_model.dart';
import 'package:articles_app_bharatnxt_assignment/articles_feature/presentation/widgets/articles_list_widget.dart';
import 'package:articles_app_bharatnxt_assignment/core/constants/app_strings.dart';
import 'package:articles_app_bharatnxt_assignment/core/dependency_injection/injection.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ArticlesScreen extends StatefulWidget {
  const ArticlesScreen({super.key});

  @override
  State<ArticlesScreen> createState() => _ArticlesScreenState();
}

class _ArticlesScreenState extends State<ArticlesScreen> with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColorLight.withAlpha(500),
      appBar: AppBar(
        centerTitle: false,
        title: Text(AppStrings.articles, style: Theme.of(context).textTheme.titleLarge),
        bottom: TabBar(
          indicatorPadding: EdgeInsets.symmetric(horizontal: 32),
          indicatorSize: TabBarIndicatorSize.tab,
          labelStyle: Theme.of(context).textTheme.titleSmall,
          controller: _tabController,
          tabs: [Tab(text: AppStrings.all), Tab(text: AppStrings.favorites)],
        ),
      ),
      body: SafeArea(
        child: TabBarView(
          controller: _tabController,
          children: [
            ChangeNotifierProvider(
              create: (context) => ArticlesViewModel(getIt<GetAllArticlesUsecase>(), getIt<GetFavoriteArticlesUsecase>(), isFavorite: false),
              child: ArticleListWidget(),
            ),
            ChangeNotifierProvider(
              create: (context) => ArticlesViewModel(getIt<GetAllArticlesUsecase>(), getIt<GetFavoriteArticlesUsecase>(), isFavorite: true),
              child: ArticleListWidget(),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}
