// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:fluter_sample_test/feature/domain/models/source.dart';

class News {
  String? author;
  String? title;
  String? url;
  String? desc;
  String? urlToImage;
  Source? source;
  String? content;

  News(
      {required this.author,
      required this.title,
      required this.url,
      required this.desc,
      required this.urlToImage,
      required this.source,
      required this.content});
}
