import 'dart:math';

import 'package:fluter_sample_test/feature/data/repositories/news_repository_impl.dart';
import 'package:fluter_sample_test/feature/domain/usercases/get_news.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    UserCaseGetNews(repo: NewsRepositoryIml()).invoke().listen((event) {
      print('load data');
      event?.forEach((element) {
        print(element.title);
      });
    });
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('Hello World!123'),
        ),
      ),
    );
  }
}
