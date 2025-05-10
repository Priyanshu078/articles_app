import 'package:articles_app_bharatnxt_assignment/articles_feature/domain/usecases/get_articles_usecase.dart';
import 'package:articles_app_bharatnxt_assignment/articles_feature/presentation/screens/articles_screen.dart';
import 'package:articles_app_bharatnxt_assignment/articles_feature/presentation/viewmodels/articles_view_model.dart';
import 'package:articles_app_bharatnxt_assignment/core/injection.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  registerDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Articles App',
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple)),
      home: ChangeNotifierProvider(
        create: (context) => ArticlesViewModel(getIt<GetArticlesUsecase>()), 
        child: ArticlesScreen(),
      ),
    );
  }
}
