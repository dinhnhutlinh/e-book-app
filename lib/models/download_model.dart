import 'package:json_annotation/json_annotation.dart';

part 'download_model.g.dart';

@JsonSerializable()
class DownloadModel {
  String bookId;
  String location;
  DownloadModel({
    required this.bookId,
    required this.location,
  });
  factory DownloadModel.fromJson(Map<String, dynamic> json) =>
      _$DownloadModelFromJson(json);
  Map<String, dynamic> toJson() => _$DownloadModelToJson(this);
}
