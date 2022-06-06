import 'package:e_book_app/domain/usecases/google_sign_in_usecae.dart';
import 'package:e_book_app/domain/usecases/sign_in_usecase.dart';
import 'package:e_book_app/injection.dart';
import 'package:e_book_app/presetations/home/pages/home_page.dart';
import 'package:e_book_app/themes/app_colors.dart';
import 'package:e_book_app/utils/vadidator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SignInController extends GetxController {
  final SignInUsecase _signInUsecase = getIt<SignInUsecase>();
  final SignInWithGoogleUseCase _signInWithGoogleUseCase =
      getIt<SignInWithGoogleUseCase>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void signIn() {
    String? mess;

    final validator = Validator();

    mess = validator.checkPassword('Mật khẩu', passwordController.text);

    mess = validator.isEmail('Email', emailController.text);

    if (mess != null) {
      Get.defaultDialog(
        title: 'Đăng Nhập',
        contentPadding: const EdgeInsets.only(
          right: 16,
          left: 16,
          top: 24,
          bottom: 24,
        ),
        buttonColor: AppColors.darkBlue,
        content: ListBody(
          children: [
            Text(mess),
          ],
        ),
        radius: 8,
        textCancel: 'Ok',
        cancelTextColor: AppColors.darkBlue,
      );
      return;
    }

    _signInUsecase
        .execute(email: emailController.text, password: passwordController.text)
        .then((value) => Get.toNamed(HomePage.route))
        .catchError(
          (error) => Get.dialog(
            AlertDialog(
              title: const Text('Đăng nhập'),
              content: ListBody(
                children: [
                  Text(
                    error.toString(),
                  ),
                ],
              ),
              actions: <Widget>[
                TextButton(
                  child: Text(
                    'Xác Nhận',
                    style: GoogleFonts.openSans(color: AppColors.darkBlue),
                  ),
                  onPressed: () => Get.back(),
                ),
              ],
            ),
          ),
        );
  }

  void signInWithGoogle() {
    _signInWithGoogleUseCase
        .execute()
        .then((value) => Get.toNamed(HomePage.route))
        .catchError(
          (error) => Get.dialog(
            AlertDialog(
              title: const Text('Đăng nhập'),
              content: ListBody(
                children: [
                  Text(
                    error.toString(),
                  ),
                ],
              ),
              actions: <Widget>[
                TextButton(
                  child: Text(
                    'Xác Nhận',
                    style: GoogleFonts.openSans(color: AppColors.darkBlue),
                  ),
                  onPressed: () => Get.back(),
                ),
              ],
            ),
          ),
        );
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
