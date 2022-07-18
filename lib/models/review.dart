// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

import 'package:e_book_app/models/user_profile.dart';

part 'review.g.dart';

@JsonSerializable(explicitToJson: true)
class Review {
  @JsonKey(name: 'user')
  UserProfile? user;
  int? rate;
  String? content;
  DateTime? update;

  Review({
    this.user,
    this.rate,
    this.content,
    this.update,
  });

  factory Review.fromJson(Map<String, dynamic> json) => _$ReviewFromJson(json);
  Map<String, dynamic> toJson() => _$ReviewToJson(this);
}
