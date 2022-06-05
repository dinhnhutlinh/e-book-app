// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:e_book_app/data/models/user_profile_model.dart';

class UserProfile {
  final String id;
  final String? name;
  final String? avatar;
  final bool? isAdmin;
  final String? status;

  UserProfile({
    required this.id,
    this.name,
    this.avatar,
    this.isAdmin,
    this.status,
  });

  UserProfileModel toUserModel() =>
      UserProfileModel(id, name, avatar, isAdmin, status);
}
