import 'package:e_book_app/common_widget/stateless/app_alert_dialog.dart';
import 'package:e_book_app/presetations/auth/pages/sign_in_page.dart';
import 'package:e_book_app/presetations/home/pages/home_page.dart';
import 'package:e_book_app/services/auth_service.dart';
import 'package:e_book_app/utils/exception.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final _auhtService = Get.find<AuthService>();

  Future<void> signIn({required String email, required String password}) async {
    EasyLoading.show(status: 'Xin chờ');
    await _auhtService.signIn(email: email, password: password).then((value) {
      EasyLoading.dismiss();
      Get.offAllNamed(HomePage.route);
    }).onError((error, stackTrace) {
      EasyLoading.dismiss();

      if (error is AuthException) {
        AppAlertDialog.show(title: 'Lỗi', content: error.mess);
      }
    });
  }

  Future<void> signInWithGoogle() async {
    EasyLoading.show(status: 'Xin chờ');
    await _auhtService.signInWithGoogle().then((value) {
      EasyLoading.dismiss();
      Get.offNamed(HomePage.route);
    }).onError((error, stackTrace) {
      EasyLoading.dismiss();
      AppAlertDialog.show(
        title: 'Lỗi',
        content: error.toString(),
      );
    });
  }

  Future signInWithFacebook() async {
    EasyLoading.show(status: 'Xin chờ');
    await _auhtService.signInWithFacebook().then((value) {
      EasyLoading.dismiss();
      Get.offNamed(HomePage.route);
    }).onError((error, stackTrace) {
      EasyLoading.dismiss();
      AppAlertDialog.show(
        title: 'Lỗi',
        content: error.toString(),
      );
    });
  }

  void signOut() {
    _auhtService.signOut();
    Get.offAllNamed(SignInPage.route);
  }
}
