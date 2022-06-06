import 'package:e_book_app/domain/usecases/sign_up_usecase.dart';
import 'package:e_book_app/injection.dart';
import 'package:e_book_app/presetations/home/pages/home_page.dart';
import 'package:e_book_app/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpController extends GetxController {
  final SignUpUsecase _signUpUseCase = getIt<SignUpUsecase>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final rePasswordController = TextEditingController();

  void signIn() {
    _signUpUseCase
        .execute(email: emailController.text, password: passwordController.text)
        .then((value) => Get.toNamed(HomePage.route))
        .catchError(
          (error) => Get.dialog(
            AlertDialog(
              title: const Text('Đăng nhập'),
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
    rePasswordController.dispose();
    super.onClose();
  }
}
