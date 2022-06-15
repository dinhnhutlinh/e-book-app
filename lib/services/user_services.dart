import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_book_app/configs/defind.dart';
import 'package:e_book_app/models/user_profile.dart';
import 'package:e_book_app/services/auth_service.dart';
import 'package:get/get.dart';

class UserService extends GetxService {
  final _userRef = FirebaseFirestore.instance.collection(Defind.user);

  UserProfile? _profile;

  @override
  Future<void> onInit() async {
    String uid = Get.find<AuthService>().user?.uid ?? '';
    _profile = await getUserProfile(uid);

    super.onInit();
  }

  UserProfile? get profile => _profile;

  Future<UserProfile> getUserProfile(String uid) async =>
      await _userRef.doc(uid).get().then(
            (value) => UserProfile.fromJson(
              value.data() as Map<String, dynamic>,
            ),
          );

  Future<int> countUser() async =>
      await _userRef.get().then((value) => value.docs.length);
}
