import 'package:articles_app_bharatnxt_assignment/articles_feature/presentation/viewmodels/articles_view_model.dart';
import 'package:articles_app_bharatnxt_assignment/articles_feature/presentation/widgets/articles_list_widget.dart';
import 'package:articles_app_bharatnxt_assignment/core/constants/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ArticleListScreen extends StatefulWidget {
  const ArticleListScreen({super.key});

  @override
  State<ArticleListScreen> createState() => _ArticleListScreenState();
}

class _ArticleListScreenState extends State<ArticleListScreen> with SingleTickerProviderStateMixin {
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
        bottom: PreferredSize(
          preferredSize: Size(double.infinity, 25),
          child: TabBar(
            indicatorPadding: EdgeInsets.symmetric(horizontal: 32),
            indicatorSize: TabBarIndicatorSize.tab,
            labelStyle: Theme.of(context).textTheme.titleSmall,
            controller: _tabController,
            tabs: [Tab(text: AppStrings.all), Tab(text: AppStrings.favorites)],
          ),
        ),
      ),
      body: SafeArea(
        child: TabBarView(
          controller: _tabController,
          children: [
            Consumer<ArticlesViewModel>(
              builder: (context, viewModel, _) {
                return ArticleListWidget(
                  articleList: viewModel.allArticles,
                  refreshArticleList: () => viewModel.getAllArticles(shouldNotify: true),
                  uiState: viewModel.uiState,
                );
              },
            ),
            Consumer<ArticlesViewModel>(
              builder: (context, viewModel, _) {
                return ArticleListWidget(
                  articleList: viewModel.favoriteArticles,
                  refreshArticleList: () => viewModel.getFavoriteArticles(shouldNotify: true),
                  uiState: viewModel.favArticlesUIState,
                  isFavoriteList: true,
                );
              },
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
