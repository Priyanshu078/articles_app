import 'package:equatable/equatable.dart';

class ArticleEntity extends Equatable {
  final String title;
  final String body;

  const ArticleEntity({required this.title, required this.body});

  @override
  List<Object?> get props => [title, body];
}
