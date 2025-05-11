import 'package:equatable/equatable.dart';

class ArticleEntity extends Equatable {
  final String title;
  final String body;
  final bool isFavorite;

  const ArticleEntity({required this.title, required this.body, required this.isFavorite});

  @override
  List<Object?> get props => [title, body];

  ArticleEntity copyWith({String? title, String? body, bool? isFavorite}) {
    return ArticleEntity(title: title ?? this.title, body: body ?? this.body, isFavorite: isFavorite ?? this.isFavorite);
  }
}
