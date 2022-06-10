import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_book_app/configs/defind.dart';
import 'package:e_book_app/models/user_profile.dart';
import 'package:e_book_app/utils/exception.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserRepository {
  final CollectionReference _userProfiles =
      FirebaseFirestore.instance.collection(Defind.userCollections);
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  User? getUser() => _firebaseAuth.currentUser;

  Future<UserProfile> getUserProfile(String uid) async {
    final repo = await _userProfiles.doc(uid).get();
    return UserProfile.fromJson(repo.data() as Map<String, dynamic>);
  }

  Future<void> createUserProfileWithGoogle(UserProfile userProfile) async {
    if (!(await wasExitUser(userProfile.id))) {
      await createUserProfile(userProfile);
    } else {
      await updateLastSignIn(userProfile.id);
    }
  }

  Future<void> updateLastSignIn(String uid) async {
    await _userProfiles.doc(uid).update({'lastSignin': DateTime.now()});
  }

  Future<bool> wasExitUser(String uid) async {
    return (await _userProfiles.doc(uid).get()).exists;
  }

  Future<void> createUserProfile(UserProfile userProfile) async {
    await _userProfiles
        .doc(userProfile.id)
        .set(
          userProfile.toJson(),
        )
        .catchError((error) {
      throw UserException('Không tạo được tài khoản');
    });
  }
}
