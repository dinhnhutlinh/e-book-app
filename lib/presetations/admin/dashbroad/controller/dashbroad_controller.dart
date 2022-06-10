import 'package:e_book_app/models/user_profile.dart';
import 'package:e_book_app/presetations/auth/pages/sign_in_page.dart';
import 'package:e_book_app/presetations/user/controllers/user_controller.dart';
import 'package:e_book_app/services/auth_service.dart';
import 'package:get/get.dart';

class DashbroadController extends GetxController {
  final _auhtService = Get.find<AuthService>();
  final _userControl = Get.find<UserController>();

  void logOut() {
    _auhtService.signOut();
    Get.offAllNamed(SignInPage.route);
  }

  UserProfile? get profile => _userControl.profile;
}
