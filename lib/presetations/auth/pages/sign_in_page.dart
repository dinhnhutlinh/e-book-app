import 'package:e_book_app/assets.gen.dart';
import 'package:e_book_app/presetations/auth/controllers/auth_controller.dart';
import 'package:e_book_app/presetations/auth/widgets/email_input_popup.dart';
import 'package:e_book_app/presetations/auth/widgets/sign_up_bts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInPage extends GetView<AuthController> {
  static const route = '/SignIn';
  final email = TextEditingController();
  final password = TextEditingController();

  SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorScheme.primaryContainer,
        toolbarHeight: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: colorScheme.primaryContainer,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(24),
                      bottomRight: Radius.circular(24),
                    ),
                  ),
                  height: Get.height / 3,
                  child: Center(
                    child: Assets.resources.images.logoOrange.image(
                      height: 100,
                      color: colorScheme.primary,
                    ),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Form(
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Text('Welcome to EBOOK'.tr,
                                style: textTheme.headline5?.copyWith(
                                    color: colorScheme.primary,
                                    fontWeight: FontWeight.bold)),
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          TextField(
                            controller: email,
                            decoration: InputDecoration(
                              labelText: 'Email'.tr,
                              border: const OutlineInputBorder(),
                            ),
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          TextField(
                            controller: password,
                            obscureText: true,
                            decoration: InputDecoration(
                              labelText: 'Password'.tr,
                              border: const OutlineInputBorder(),
                            ),
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          SizedBox(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                OutlinedButton(
                                  onPressed: () =>
                                      Get.dialog(EmailInputPopup()),
                                  child: Text('Forget password'.tr),
                                ),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    padding: const EdgeInsets.only(
                                        right: 32,
                                        left: 32,
                                        top: 12,
                                        bottom: 12),
                                    // Foreground color
                                    onPrimary: Theme.of(context)
                                        .colorScheme
                                        .primaryContainer,
                                    // Background color
                                    primary:
                                        Theme.of(context).colorScheme.primary,
                                  ),
                                  onPressed: () => controller.signIn(
                                      email: email.text,
                                      password: password.text),
                                  child: Text('Login'.tr),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          OutlinedButton.icon(
                            style: OutlinedButton.styleFrom(
                              // Foreground color

                              padding: const EdgeInsets.only(
                                  right: 32, left: 32, top: 12, bottom: 12),
                            ),
                            onPressed: controller.signInWithGoogle,
                            icon: Assets.resources.icons.googleLogo.svg(),
                            label: Text('Sign in with Google'.tr),
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          TextButton(
                              onPressed: () => Get.bottomSheet(SignUpBts()),
                              child: Text('Sign up'.tr))
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
