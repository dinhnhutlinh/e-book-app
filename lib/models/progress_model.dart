// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'progress_model.g.dart';

@JsonSerializable()
class ProgressModel {
  String bookId;
  int page;
  ProgressModel({
    required this.bookId,
    required this.page,
  });

  factory ProgressModel.fromJson(Map<String, dynamic> json) =>
      _$ProgressModelFromJson(json);
  Map<String, dynamic> toJson() => _$ProgressModelToJson(this);
}
