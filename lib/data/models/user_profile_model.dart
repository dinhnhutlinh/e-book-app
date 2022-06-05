import 'package:e_book_app/domain/entities/user_profile.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_profile_model.g.dart';

@JsonSerializable()
class UserProfileModel {
  final String id;
  final String? name;
  final String? avatar;
  final bool? isAdmin;
  final String? status;

  UserProfileModel(this.id, this.name, this.avatar, this.isAdmin, this.status);

  factory UserProfileModel.fromJson(Map<String, dynamic> json) =>
      _$UserProfileModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserProfileModelToJson(this);

  UserProfile toUserProfile() => UserProfile(
      id: id, avatar: avatar, isAdmin: isAdmin, name: name, status: status);
}
