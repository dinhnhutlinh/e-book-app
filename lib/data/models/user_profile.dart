import 'package:firebase_auth/firebase_auth.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_profile.g.dart';

@JsonSerializable()
class UserProfile {
  final String id;
  final String? name;
  final String? avatar;
  final bool? isAdmin;
  final String? status;

  UserProfile(
      {required this.id,
      this.name,
      this.avatar,
      this.isAdmin = false,
      this.status = UserStatus.active});

  factory UserProfile.fromJson(Map<String, dynamic> json) =>
      _$UserProfileFromJson(json);

  Map<String, dynamic> toJson() => _$UserProfileToJson(this);

  static UserProfile fromUser(User user) => UserProfile(
        id: user.uid,
        name: user.displayName,
        avatar: user.photoURL,
      );
}

class UserStatus {
  static const String lock = 'lock';
  static const String active = 'active';
}
