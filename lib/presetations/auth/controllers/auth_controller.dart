import 'package:e_book_app/common_widget/stateless/app_alert_dialog.dart';
import 'package:e_book_app/configs/defind.dart';
import 'package:e_book_app/presetations/auth/pages/sign_in_page.dart';
import 'package:e_book_app/presetations/home/pages/home_page.dart';
import 'package:e_book_app/presetations/library/controller/download_controller.dart';
import 'package:e_book_app/services/auth_service.dart';
import 'package:e_book_app/utils/exception.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

class AuthController extends GetxController {
  final _auhtService = Get.find<AuthService>();

  Future<void> signIn({required String email, required String password}) async {
    final mess = validate(email, password, password);
    if (mess != null) {
      AppAlertDialog.show(title: 'Error'.tr, content: mess);
      return;
    }
    EasyLoading.show();
    await _auhtService.signIn(email: email, password: password).then((value) {
      EasyLoading.dismiss();
      Get.offAllNamed(HomePage.route);
    }).onError((error, stackTrace) {
      EasyLoading.dismiss();
      if (error is AuthException) {
        AppAlertDialog.show(title: 'Error'.tr, content: error.mess);
      }
    });
  }

  Future<void> signUp(
      {required String email,
      required String password,
      required String repass}) async {
    final mess = validate(email, password, repass);
    if (mess != null) {
      AppAlertDialog.show(title: 'Error'.tr, content: mess);
      return;
    }
    EasyLoading.show();
    await _auhtService.signUp(email: email, password: password).then((value) {
      EasyLoading.dismiss();
      Get.offAllNamed(HomePage.route);
    }).onError((error, stackTrace) {
      EasyLoading.dismiss();
      if (error is AuthException) {
        AppAlertDialog.show(title: 'Error'.tr, content: error.mess);
      }
    });
  }

  String? validate(String email, String password, String repass) {
    if (email.isEmpty) {
      return 'Pleace write Email'.tr;
    }
    if (password.isEmpty) {
      return 'Pleace write password'.tr;
    }
    if (repass.isEmpty) {
      return 'Pleace write repassword'.tr;
    }
    if (!email.isEmail) return 'Invalid email'.tr;

    if (password != repass) return 'Password and repasssword don\'t correct'.tr;

    return null;
  }

  Future<void> signInWithGoogle() async {
    EasyLoading.show();
    await _auhtService.signInWithGoogle().then((value) {
      EasyLoading.dismiss();
      Get.offNamed(HomePage.route);
    }).onError((error, stackTrace) {
      EasyLoading.dismiss();
      AppAlertDialog.show(
        title: 'Error'.tr,
        content: 'Can\'t sign in'.tr,
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

  void forgetPassword(String email) {
    FirebaseAuth.instance.sendPasswordResetEmail(email: email);
    AppAlertDialog.show(
        title: 'Forget password'.tr, content: 'Check your mail box'.tr);
  }

  Future<void> signOut() async {
    _auhtService.signOut();
    Get.find<DownloadController>().removeAllFileLocal();
    Hive.box(Define.dbName).clear();
    // Get.delete<UserController>();
    Get.offAllNamed(SignInPage.route);
  }
}
