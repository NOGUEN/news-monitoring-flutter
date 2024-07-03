// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsListModel _$NewsListModelFromJson(Map<String, dynamic> json) =>
    NewsListModel(
      news: (json['news'] as List<dynamic>)
          .map((e) => NewsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$NewsListModelToJson(NewsListModel instance) =>
    <String, dynamic>{
      'news': instance.news,
    };

NewsModel _$NewsModelFromJson(Map<String, dynamic> json) => NewsModel(
      id: (json['id'] as num).toInt(),
      site_id: (json['site_id'] as num).toInt(),
      title: json['title'] as String,
      link: json['link'] as String,
      published_at: DateTime.parse(json['published_at'] as String),
    );

Map<String, dynamic> _$NewsModelToJson(NewsModel instance) => <String, dynamic>{
      'id': instance.id,
      'site_id': instance.site_id,
      'title': instance.title,
      'link': instance.link,
      'published_at': instance.published_at.toIso8601String(),
    };
