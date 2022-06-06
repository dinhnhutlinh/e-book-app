import 'package:e_book_app/assets.gen.dart';
import 'package:e_book_app/common_widget/stateful/input_from.dart';
import 'package:e_book_app/common_widget/stateless/custom_round_button.dart';
import 'package:e_book_app/presetations/auth/controllers/sign_up_controller.dart';
import 'package:e_book_app/themes/app_colors.dart';
import 'package:e_book_app/themes/app_text_style.dart';
import 'package:e_book_app/utils/vadidator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpPage extends StatelessWidget {
  static const route = '/SignUp';

  final SignUpController _signUpController = Get.put(SignUpController());

  final _formKey = GlobalKey<FormState>();

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
                  const SizedBox(
                    height: 200,
                    child: Center(
                      child: Text('logo'),
                    ),
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
                            controller: _signUpController.emailController,
                            isPassword: false,
                            hintText: 'Email',
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          InputForm(
                            controller: _signUpController.passwordController,
                            isPassword: true,
                            hintText: 'Mật khẩu',
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          InputForm(
                            controller: _signUpController.rePasswordController,
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
                                onPress: () {
                                  if (_formKey.currentState!.validate()) {
                                    _signUpController.signIn();
                                  }
                                },
                                title: 'Đăng Nhập'),
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
