import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class NewsResponse {
  String? status;
  int? totalResults;
  List<ArticlesDto>? articles;

  NewsResponse({this.status, this.totalResults, this.articles});

  NewsResponse.fromJson(Map<String, dynamic> json) {
    if (json["status"] is String) {
      status = json["status"];
    }
    if (json["totalResults"] is int) {
      totalResults = json["totalResults"];
    }
    if (json["articles"] is List) {
      articles = json["articles"] == null
          ? null
          : (json["articles"] as List)
              .map((e) => ArticlesDto.fromJson(e))
              .toList();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["status"] = status;
    _data["totalResults"] = totalResults;
    if (articles != null) {
      _data["articles"] = articles?.map((e) => e.toJson()).toList();
    }
    return _data;
  }
}

class ArticlesDto {
  SourceDto? source;
  String? author;
  String? title;
  String? description;
  String? url;
  dynamic urlToImage;
  String? publishedAt;
  String? content;

  ArticlesDto(
      {this.source,
      this.author,
      this.title,
      this.description,
      this.url,
      this.urlToImage,
      this.publishedAt,
      this.content});

  ArticlesDto.fromJson(Map<String, dynamic> json) {
    if (json["source"] is Map) {
      source =
          json["source"] == null ? null : SourceDto.fromJson(json["source"]);
    }
    if (json["author"] is String) {
      author = json["author"];
    }
    if (json["title"] is String) {
      title = json["title"];
    }
    if (json["description"] is String) {
      description = json["description"];
    }
    if (json["url"] is String) {
      url = json["url"];
    }
    urlToImage = json["urlToImage"];
    if (json["publishedAt"] is String) {
      publishedAt = json["publishedAt"];
    }
    if (json["content"] is String) {
      content = json["content"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if (source != null) {
      _data["source"] = source?.toJson();
    }
    _data["author"] = author;
    _data["title"] = title;
    _data["description"] = description;
    _data["url"] = url;
    _data["urlToImage"] = urlToImage;
    _data["publishedAt"] = publishedAt;
    _data["content"] = content;
    return _data;
  }
}

class SourceDto {
  String? id;
  String? name;

  SourceDto({this.id, this.name});

  SourceDto.fromJson(Map<String, dynamic> json) {
    if (json["id"] is String) {
      id = json["id"];
    }
    if (json["name"] is String) {
      name = json["name"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["name"] = name;
    return _data;
  }
}
