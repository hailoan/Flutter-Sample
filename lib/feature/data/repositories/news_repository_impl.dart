import 'dart:convert';

import 'package:fluter_sample_test/feature/data/mappers/mappers.dart';
import 'package:fluter_sample_test/feature/data/models/dto/news_response.dart';
import 'package:fluter_sample_test/feature/domain/models/news.dart';
import 'package:fluter_sample_test/feature/domain/repositories/news_repository.dart';

import 'package:http/http.dart' as http;

import '../../../config/base_url_config.dart';
import '../../../config/constant_config.dart';

class NewsRepositoryIml implements NewsRepository {
  @override
  Future<List<News>?> getTopNews(String category) async {
    String url =
        '${BaseUrlConfig.baseUrlProduction}${BaseUrlConfig.getEverything}?apiKey=${ConstantConfig.keyNewApi}&q=bitcoin';
    print(url);
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return NewsResponse.fromJson(jsonDecode(response.body))
          .articles
          ?.map((e) => Mapppers.articlesDtoToNews(e))
          .toList();
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load news');
    }
  }
}
