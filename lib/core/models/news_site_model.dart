// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';

part 'news_site_model.g.dart';

@JsonSerializable()
class NewsSiteListModel {
  final List<NewsSiteModel> news_sites;

  NewsSiteListModel({
    required this.news_sites,
  });

  factory NewsSiteListModel.fromJson(Map<String, dynamic> json) =>
      _$NewsSiteListModelFromJson(json);

  Map<String, dynamic> toJson() => _$NewsSiteListModelToJson(this);
}

@JsonSerializable()
class NewsSiteModel {
  final String id;
  final String name;
  final String url;
  final String created_at;

  NewsSiteModel({
    required this.id,
    required this.name,
    required this.url,
    required this.created_at,
  });

  factory NewsSiteModel.fromJson(Map<String, dynamic> json) =>
      _$NewsSiteModelFromJson(json);

  Map<String, dynamic> toJson() => _$NewsSiteModelToJson(this);
}
