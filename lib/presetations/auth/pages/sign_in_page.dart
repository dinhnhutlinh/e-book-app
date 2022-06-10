import 'package:e_book_app/assets.gen.dart';
import 'package:e_book_app/presetations/auth/controllers/auth_controller.dart';
import 'package:e_book_app/themes/app_colors.dart';
import 'package:e_book_app/themes/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInPage extends StatelessWidget {
  static const route = '/SignIn';

  // final _formKey = GlobalKey<FormState>();
  // final _emailController = TextEditingController();
  // final _passwordController = TextEditingController();

  final _authController = Get.put(AuthController());

  SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height,
      width: Get.width,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            AppColors.darkBlue,
            AppColors.lightBlue,
          ],
          stops: [0.0, 1.0],
          tileMode: TileMode.clamp,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: Get.height / 2,
                  child: Center(
                    child: Assets.resources.images.logoWhite.image(height: 100),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Đăng nhập',
                            style: AppTextStyle.headerWhite,
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Container(
                          width: double.infinity,
                          height: 52,
                          decoration: const ShapeDecoration(
                            shape: StadiumBorder(),
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [AppColors.deepOrange, AppColors.orange],
                            ),
                          ),
                          child: MaterialButton(
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                            shape: const StadiumBorder(),
                            onPressed: _authController.signInWithGoogle,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Đăng nhập bằng ',
                                  style: AppTextStyle.buttonWhite,
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Assets.resources.icons.googleLogo
                                    .svg(height: 36)
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          'Hoặc',
                          style: AppTextStyle.textWhite,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Container(
                          width: double.infinity,
                          height: 52,
                          decoration: const ShapeDecoration(
                            shape: StadiumBorder(),
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [AppColors.deepOrange, AppColors.orange],
                            ),
                          ),
                          child: MaterialButton(
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                            shape: const StadiumBorder(),
                            onPressed: _authController.signInWithFacebook,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Đăng nhập bằng ',
                                  style: AppTextStyle.buttonWhite,
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Assets.resources.icons.facebookLogo
                                    .svg(height: 36)
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
