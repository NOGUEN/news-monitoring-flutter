// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';

part 'page_count_model.g.dart';

@JsonSerializable()
class PageCountModel {
  final int total_pages;

  PageCountModel({
    required this.total_pages,
  });

  factory PageCountModel.fromJson(Map<String, dynamic> json) =>
      _$PageCountModelFromJson(json);

  Map<String, dynamic> toJson() => _$PageCountModelToJson(this);
}
