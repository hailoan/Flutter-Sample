import 'package:fluter_sample_test/feature/data/models/dto/news_response.dart';
import 'package:fluter_sample_test/feature/domain/models/source.dart';

import '../../domain/models/news.dart';

class Mapppers {
  static News articlesDtoToNews(ArticlesDto dto) {
    return News(
        author: dto.author,
        title: dto.title,
        url: dto.url,
        desc: dto.description,
        urlToImage: dto.urlToImage,
        source: sourceDtoToSource(dto.source),
        content: dto.content);
  }

  static Source? sourceDtoToSource(SourceDto? dto) {
    return dto == null ? null : Source(id: dto.id, name: dto.name);
  }
}
