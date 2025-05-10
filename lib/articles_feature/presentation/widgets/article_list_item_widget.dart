import 'package:articles_app_bharatnxt_assignment/articles_feature/domain/entities/article_entity.dart';
import 'package:flutter/material.dart';

class ArticleListItemWidget extends StatelessWidget {
  const ArticleListItemWidget({super.key, required this.article});

  final ArticleEntity article;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
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
              IconButton(
                onPressed: () {},
                icon: Icon(article.isFavorite ? Icons.favorite : Icons.favorite_outline, color: article.isFavorite ? Colors.red : Colors.black),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
