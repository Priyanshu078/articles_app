import 'package:articles_app_bharatnxt_assignment/articles_feature/domain/entities/article_entity.dart';
import 'package:articles_app_bharatnxt_assignment/articles_feature/presentation/screens/article_detail_screen.dart';
import 'package:articles_app_bharatnxt_assignment/articles_feature/presentation/viewmodels/articles_view_model.dart';
import 'package:articles_app_bharatnxt_assignment/articles_feature/presentation/widgets/article_list_item_widget.dart';
import 'package:articles_app_bharatnxt_assignment/core/constants/app_strings.dart';
import 'package:articles_app_bharatnxt_assignment/core/enums/ui_state_enum.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ArticleListWidget extends StatefulWidget {
  const ArticleListWidget({
    super.key,
    this.isFavoriteList = false,
    required this.articleList,
    required this.refreshArticleList,
    required this.uiState,
  });

  final bool isFavoriteList;
  final List<ArticleEntity> articleList;
  final Function() refreshArticleList;
  final UIState uiState;

  @override
  State<ArticleListWidget> createState() => _ArticleListWidgetState();
}

class _ArticleListWidgetState extends State<ArticleListWidget> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: TextField(
            controller: _controller,
            decoration: InputDecoration(hintText: "Search", border: OutlineInputBorder(borderRadius: BorderRadius.circular(8))),
          ),
        ),
        const SizedBox(height: 8),
        Expanded(
          child: RefreshIndicator(
            onRefresh: () async {
              await widget.refreshArticleList();
            },
            child: LayoutBuilder(
              builder: (context, constraints) {
                if (widget.articleList.isEmpty) {
                  return _buildPlaceHolder(constraints);
                } else {
                  return ListView.builder(
                    itemCount: widget.articleList.length,
                    itemBuilder: (_, index) {
                      final article = widget.articleList[index];
                      return ArticleListItemWidget(
                        article: article,
                        markFavoriteCallback: () => context.read<ArticlesViewModel>().markFavorite(index),
                        onTapCallback: () => _navigateToDetailPage(article),
                        isFavoritesTile: widget.isFavoriteList,
                      );
                    },
                  );
                }
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPlaceHolder(BoxConstraints constraints) {
    return SingleChildScrollView(
      physics: AlwaysScrollableScrollPhysics(),
      child: SizedBox(
        height: constraints.maxHeight,
        width: constraints.maxWidth,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              widget.uiState == UIState.loading
                  ? Center(child: CircularProgressIndicator())
                  : widget.uiState == UIState.error
                  ? Center(child: Text(AppStrings.error))
                  : Center(child: Text(AppStrings.noArticlesFound)),
            ],
          ),
        ),
      ),
    );
  }

  void _navigateToDetailPage(ArticleEntity article) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => ArticleDetailScreen(article: article)));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
