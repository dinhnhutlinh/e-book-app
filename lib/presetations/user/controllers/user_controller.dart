import 'package:e_book_app/models/user_profile.dart';
import 'package:e_book_app/presetations/auth/pages/sign_in_page.dart';
import 'package:e_book_app/services/auth_service.dart';
import 'package:e_book_app/services/user_services.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  final _auhtService = Get.find<AuthService>();
  final _userService = Get.find<UserService>();
  UserProfile? _profile;
  final RxBool _isLoading = true.obs;

  @override
  Future<void> onInit() async {
    String uid = _auhtService.user.uid;
    _profile = await _userService.getUserProfile(uid);
    _isLoading.value = false;

    super.onInit();
  }

  void logout() {
    _auhtService.signOut();
    Get.offAllNamed(SignInPage.route);
  }

  UserProfile? get profile => _profile;

  bool get isLoading => _isLoading.value;
}
