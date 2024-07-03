// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_site_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsSiteListModel _$NewsSiteListModelFromJson(Map<String, dynamic> json) =>
    NewsSiteListModel(
      news_sites: (json['news_sites'] as List<dynamic>)
          .map((e) => NewsSiteModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$NewsSiteListModelToJson(NewsSiteListModel instance) =>
    <String, dynamic>{
      'news_sites': instance.news_sites,
    };

NewsSiteModel _$NewsSiteModelFromJson(Map<String, dynamic> json) =>
    NewsSiteModel(
      id: json['id'] as String,
      name: json['name'] as String,
      url: json['url'] as String,
      created_at: json['created_at'] as String,
    );

Map<String, dynamic> _$NewsSiteModelToJson(NewsSiteModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'url': instance.url,
      'created_at': instance.created_at,
    };
