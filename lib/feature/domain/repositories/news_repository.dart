import 'package:fluter_sample_test/feature/domain/models/news.dart';

abstract class NewsRepository {
  Future<List<News>?> getTopNews(String category);
}
