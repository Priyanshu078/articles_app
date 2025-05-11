import 'package:articles_app_bharatnxt_assignment/articles_feature/domain/entities/article_entity.dart';
import 'package:flutter/material.dart';

class ArticleListItemWidget extends StatelessWidget {
  const ArticleListItemWidget({
    super.key,
    required this.article,
    required this.markFavoriteCallback,
    required this.onTapCallback,
    required this.isFavoritesTile,
  });

  final ArticleEntity article;
  final VoidCallback markFavoriteCallback;
  final VoidCallback onTapCallback;
  final bool isFavoritesTile;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: onTapCallback,
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
          elevation: 2,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 8, 8),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(article.title, style: Theme.of(context).textTheme.bodyLarge, maxLines: 1),
                      Text(article.body, style: Theme.of(context).textTheme.bodyMedium, maxLines: 1),
                    ],
                  ),
                ),
                if (!isFavoritesTile)
                  IconButton(
                    onPressed: markFavoriteCallback,
                    icon: Icon(article.isFavorite ? Icons.favorite : Icons.favorite_outline, color: article.isFavorite ? Colors.red : Colors.black),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
