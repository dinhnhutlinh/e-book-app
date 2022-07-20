// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'review.g.dart';

@JsonSerializable(explicitToJson: true)
class Review {
  String? userId;
  String? userName;
  String? userImage;
  int? rate;
  String? content;
  DateTime? update;
  Review({
    this.userId,
    this.userName,
    this.userImage,
    this.rate,
    this.content,
    this.update,
  });

  factory Review.fromJson(Map<String, dynamic> json) => _$ReviewFromJson(json);
  Map<String, dynamic> toJson() => _$ReviewToJson(this);
}
