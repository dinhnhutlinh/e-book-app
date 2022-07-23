import 'package:e_book_app/models/user_profile.dart';
import 'package:e_book_app/services/auth_service.dart';
import 'package:e_book_app/services/user_services.dart';
import 'package:get/get.dart';

class UserController extends GetxController with StateMixin {
  final _auhtService = Get.find<AuthService>();
  final _userService = Get.find<UserService>();
  final Rxn<UserProfile> _profile = Rxn<UserProfile>();

  @override
  Future<void> onInit() async {
    String uid = _auhtService.user?.uid ?? '';

    if (await _userService.checkContainDocument(uid: uid)) {
      _profile.value = await _userService.getUserProfile(uid);
    } else {
      _profile.value = _userService.createUserProfile();
    }
    _profile.value = await _userService.getUserProfile(uid);
    change(null, status: RxStatus.success());
    super.onInit();
  }

  UserProfile? get profile => _profile.value;
  String get uid => _auhtService.user?.uid ?? '';

  void setProfile(UserProfile profile) {
    _profile.value = profile;
  }
}
