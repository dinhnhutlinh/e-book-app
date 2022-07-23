import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_book_app/configs/defind.dart';
import 'package:e_book_app/models/user_profile.dart';
import 'package:e_book_app/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';

class UserService extends GetxService {
  final _authService = Get.find<AuthService>();
  final _userRef = FirebaseFirestore.instance.collection(Define.user);
  final _userAvatarStorage = FirebaseStorage.instance.ref().child('avatar');
  @override
  Future<void> onInit() async {
    super.onInit();
  }

  Future<bool> checkContainDocument({required String uid}) async {
    var doc = await _userRef.doc(uid).get();
    return doc.exists;
  }

  Future<UserProfile> getUserProfile(String uid) async =>
      await _userRef.doc(uid).get().then(
            (value) => UserProfile.fromJson(
              value.data() as Map<String, dynamic>,
            ),
          );

  UserProfile createUserProfile() {
    User user = _authService.user!;
    UserProfile profile = UserProfile(
        id: user.uid,
        name: user.displayName ?? user.email,
        avatar: user.photoURL ?? Define.avatarLink,
        email: user.email,
        status: 'active');
    _userRef.doc(profile.id).set(profile.toJson());
    return profile;
  }

  Future<int> countUser() async =>
      await _userRef.get().then((value) => value.docs.length);

  Future<String> uploadAvatar(
      {required File image, required String uid}) async {
    final task = _userAvatarStorage.child(uid).putFile(image);
    final snap = await task.whenComplete(() {});
    return snap.ref.getDownloadURL();
  }

  UserProfile uploadProfile({required UserProfile profile}) {
    _userRef.doc(profile.id).set(profile.toJson());
    return profile;
  }
}
