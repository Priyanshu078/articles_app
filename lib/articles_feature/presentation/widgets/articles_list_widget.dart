import 'package:articles_app_bharatnxt_assignment/articles_feature/domain/entities/article_entity.dart';
import 'package:articles_app_bharatnxt_assignment/articles_feature/presentation/viewmodels/articles_view_model.dart';
import 'package:articles_app_bharatnxt_assignment/articles_feature/presentation/widgets/article_list_item_widget.dart';
import 'package:articles_app_bharatnxt_assignment/core/enums/ui_state_enum.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ArticleListWidget extends StatelessWidget {
  const ArticleListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ArticlesViewModel>(
      builder: (context, viewModel, _) {
        if (viewModel.uiState == UIState.loading) {
          return Center(child: CircularProgressIndicator());
        }

        if (viewModel.uiState == UIState.error) {
          return Center(child: Text("error"));
        }

        if (viewModel.articles.isEmpty) {
          return Center(child: Text("No Articles Found"));
        }

        return RefreshIndicator(
          onRefresh: () async {
            await viewModel.getArticles(shouldNotify: true);
          },
          child: ListView.builder(
            itemCount: viewModel.articles.length,
            itemBuilder: (context, index) {
              final article = viewModel.articles[index];
              return ArticleListItemWidget(article: ArticleEntity(title: article.title, body: article.body, isFavorite: article.isFavorite));
            },
          ),
        );
      },
    );
  }
}
