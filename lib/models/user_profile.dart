import 'package:e_book_app/utils/date_util.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_profile.g.dart';

@JsonSerializable(explicitToJson: true)
class UserProfile {
  final String? id;
  final String? name;
  final String? avatar;
  final String? email;
  final bool? isAdmin;
  final String? status;
  @TimestampConverter()
  final DateTime lastSignin;

  UserProfile({
    this.id,
    this.name,
    this.avatar,
    this.email,
    this.isAdmin = false,
    this.status = UserStatus.active,
  }) : lastSignin = DateTime.now();

  factory UserProfile.fromJson(Map<String, dynamic> json) =>
      _$UserProfileFromJson(json);

  Map<String, dynamic> toJson() => _$UserProfileToJson(this);

  static UserProfile fromUser(User user) => UserProfile(
        id: user.uid,
        name: user.displayName,
        avatar: user.photoURL,
        email: user.email,
      );

  @override
  String toString() {
    return 'UserProfile(id: $id, name: $name, avatar: $avatar, isAdmin: $isAdmin, status: $status)';
  }
}

class UserStatus {
  static const String lock = 'lock';
  static const String active = 'active';
}
