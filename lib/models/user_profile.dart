// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:firebase_auth/firebase_auth.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:e_book_app/utils/date_util.dart';

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

  UserProfile copyWith({
    String? id,
    String? name,
    String? avatar,
    String? email,
    bool? isAdmin,
    String? status,
    DateTime? lastSignin,
  }) {
    return UserProfile(
      id: id ?? this.id,
      name: name ?? this.name,
      avatar: avatar ?? this.avatar,
      email: email ?? this.email,
      isAdmin: isAdmin ?? this.isAdmin,
      status: status ?? this.status,
    );
  }
}

class UserStatus {
  static const String lock = 'lock';
  static const String active = 'active';
}
