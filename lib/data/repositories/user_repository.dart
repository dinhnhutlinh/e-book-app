import 'package:e_book_app/data/datasources/user_datasource.dart';
import 'package:e_book_app/data/models/user_profile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class UserRepository {
  final UserDataSource _dataSource;

  UserRepository(this._dataSource);

  Future createUserProfile(UserProfile userProfile) =>
      _dataSource.creatUser(userProfile);
  User? getUser() {
    return _dataSource.getUser();
  }

  Future<UserProfile> getUserProfile(String uid) =>
      _dataSource.getUserProfile(uid);

  void createUserProfileWithGoogle(UserProfile userProfile) =>
      _dataSource.createUserProfileWithGoogle(userProfile);
}
