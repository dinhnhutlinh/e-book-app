import 'package:e_book_app/assets.gen.dart';
import 'package:e_book_app/common_widget/stateful/input_from.dart';
import 'package:e_book_app/common_widget/stateless/custom_round_button.dart';
import 'package:e_book_app/presetations/auth/controllers/auth_controller.dart';
import 'package:e_book_app/presetations/auth/pages/sign_up_page.dart';
import 'package:e_book_app/themes/app_colors.dart';
import 'package:e_book_app/themes/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInPage extends StatelessWidget {
  static const route = '/SignIn';

  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final _authController = Get.find<AuthController>();

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
                            height: 16,
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                              child: Text(
                                'Quên mật khẩu',
                                style: AppTextStyle.textWhite,
                              ),
                              onPressed: () {},
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          SizedBox(
                            width: double.infinity,
                            height: 52,
                            child: CustomRoundButton(
                                onPress: () => _authController.signIn(
                                    email: _emailController.text,
                                    password: _passwordController.text),
                                title: 'Đăng Nhập'),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    'Đăng nhập bằng cách khác',
                    style: AppTextStyle.textWhite,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  InkWell(
                    onTap: _authController.signInWithGoogle,
                    child: Assets.resources.images.ellipse5.image(),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Bạn chưa có tài khoản : ',
                        style: AppTextStyle.labelWhite,
                      ),
                      TextButton(
                        onPressed: () => Get.toNamed(SignUpPage.route),
                        child: Text(
                          'Đăng ký',
                          style: AppTextStyle.buttonOrange,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
