import 'package:e_book_app/assets.gen.dart';
import 'package:e_book_app/presetations/auth/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInPage extends StatelessWidget {
  static const route = '/SignIn';

  final _authController = Get.put(AuthController());

  SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: colorScheme.primary,
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
                      Text(
                        'Login with',
                        style: textTheme.titleLarge?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 60,
                            width: 60,
                            child: ElevatedButton(
                              onPressed: _authController.signInWithGoogle,
                              clipBehavior: Clip.antiAlias,
                              child: Assets.resources.icons.googleLogo
                                  .svg(height: 52),
                            ),
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                          const Text(
                            '|',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                          SizedBox(
                            height: 60,
                            width: 60,
                            child: ElevatedButton(
                              onPressed: _authController.signInWithFacebook,
                              clipBehavior: Clip.antiAlias,
                              child: Assets.resources.icons.facebookLogo.svg(
                                height: 52,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
