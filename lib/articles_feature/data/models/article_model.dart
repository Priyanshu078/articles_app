import 'package:articles_app_bharatnxt_assignment/articles_feature/domain/entities/article_entity.dart';

class ArticleModel extends ArticleEntity {
  const ArticleModel({required super.title, required super.body});

  factory ArticleModel.fromJson(Map<String, dynamic> json) {
    return ArticleModel(title: json['title'], body: json['body']);
  }

  Map<String, dynamic> toJson() {
    return {"title": title, "body": body};
  }

  ArticleEntity toEntity() {
    return ArticleEntity(title: title, body: body);
  }
}
