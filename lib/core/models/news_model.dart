// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';

part 'news_model.g.dart';

@JsonSerializable()
class NewsListModel {
  final List<NewsModel> news;

  NewsListModel({
    required this.news,
  });

  factory NewsListModel.fromJson(Map<String, dynamic> json) =>
      _$NewsListModelFromJson(json);

  Map<String, dynamic> toJson() => _$NewsListModelToJson(this);
}

@JsonSerializable()
class NewsModel {
  final int id;
  final int site_id;
  final String title;
  final String link;
  final DateTime published_at;

  NewsModel({
    required this.id,
    required this.site_id,
    required this.title,
    required this.link,
    required this.published_at,
  });

  factory NewsModel.fromJson(Map<String, dynamic> json) =>
      _$NewsModelFromJson(json);

  Map<String, dynamic> toJson() => _$NewsModelToJson(this);
}
