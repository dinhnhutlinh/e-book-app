import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_book_app/configs/defind.dart';
import 'package:e_book_app/data/models/user_profile.dart';
import 'package:e_book_app/utils/exception.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class UserDataSource {
  final CollectionReference _userProfiles =
      FirebaseFirestore.instance.collection(Defind.userCollections);
  final FirebaseAuth _firebaseAuth;

  UserDataSource(this._firebaseAuth);

  Future creatUser(UserProfile userProfile) async {
    await _userProfiles
        .doc(userProfile.id)
        .set(
          userProfile.toJson(),
        )
        .catchError((error) {
      print(error);
      throw UserException('Không tạo được tài khoản');
    });
  }

  User? getUser() => _firebaseAuth.currentUser;

  Future<UserProfile> getUserProfile(String uid) async {
    final repo = await _userProfiles.where('id', isEqualTo: uid).get();

    return UserProfile.fromJson(jsonDecode(jsonEncode(repo.docs.first.data())));
    // throw Exception()
  }

  void createUserProfileWithGoogle(UserProfile userProfile) async {
    if (await wasExitUser(userProfile.id)) {
      await creatUser(userProfile);
    }
  }

  Future<bool> wasExitUser(String uid) async {
    return (await _userProfiles.doc(uid).get()).exists;
  }
}
