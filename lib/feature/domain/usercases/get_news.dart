// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:fluter_sample_test/feature/domain/repositories/news_repository.dart';

import '../models/news.dart';

class UserCaseGetNews {
  NewsRepository repo;
  UserCaseGetNews({
    required this.repo,
  });

  Stream<List<News>?> invoke() {
    return repo.getTopNews('').asStream();
  }
}
