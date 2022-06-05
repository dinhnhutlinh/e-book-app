import 'package:e_book_app/domain/entities/user_profile.dart';

abstract class UserRepository {
  Future createUserProfile(UserProfile userProfile);
}
