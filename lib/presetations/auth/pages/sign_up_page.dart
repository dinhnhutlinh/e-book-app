import 'package:e_book_app/assets.gen.dart';
import 'package:e_book_app/common_widget/stateful/input_from.dart';
import 'package:e_book_app/common_widget/stateless/custom_round_button.dart';
import 'package:e_book_app/presetations/auth/controllers/auth_controller.dart';
import 'package:e_book_app/themes/app_colors.dart';
import 'package:e_book_app/themes/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpPage extends StatelessWidget {
  static const route = '/SignUp';

  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _rePasswordController = TextEditingController();

  final _authController = Get.find<AuthController>();

  SignUpPage({Key? key}) : super(key: key);

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
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Center(
                    child: Assets.resources.images.logoWhite.image(height: 100),
                  ),
                  const SizedBox(
                    height: 64,
                  ),
                  Form(
                    key: _formKey,
                    autovalidateMode: AutovalidateMode.disabled,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 32, left: 32),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Đăng Nhập',
                              style: AppTextStyle.headerWhite,
                            ),
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          InputForm(
                            controller: _emailController,
                            isPassword: false,
                            hintText: 'Email',
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          InputForm(
                            controller: _passwordController,
                            isPassword: true,
                            hintText: 'Mật khẩu',
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          InputForm(
                            controller: _rePasswordController,
                            isPassword: true,
                            hintText: 'Nhập mật khẩu',
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          SizedBox(
                            width: double.infinity,
                            height: 52,
                            child: CustomRoundButton(
                                onPress: () => _authController.signUp(
                                      email: _emailController.text,
                                      password: _passwordController.text,
                                      rePassword: _rePasswordController.text,
                                    ),
                                title: 'Đăng ký'),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
