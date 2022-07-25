import 'package:e_book_app/presetations/auth/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpBts extends GetView<AuthController> {
  final email = TextEditingController();
  final password = TextEditingController();
  final repass = TextEditingController();

  SignUpBts({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: colorScheme.onInverseSurface,
      ),
      child: ListView(
        shrinkWrap: true,
        children: [
          Text('Sign up'.tr, style: textTheme.titleLarge),
          const Divider(),
          const SizedBox(
            height: 24,
          ),
          TextField(
            decoration: InputDecoration(
              labelText: 'Email'.tr,
              border: const OutlineInputBorder(),
            ),
            controller: email,
          ),
          const SizedBox(
            height: 12,
          ),
          TextField(
            decoration: InputDecoration(
              labelText: 'Password'.tr,
              border: const OutlineInputBorder(),
            ),
            obscureText: true,
            controller: password,
          ),
          const SizedBox(
            height: 12,
          ),
          TextField(
            decoration: InputDecoration(
              labelText: 'Repassword'.tr,
              border: const OutlineInputBorder(),
            ),
            obscureText: true,
            controller: repass,
          ),
          const SizedBox(
            height: 24,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.only(
                  right: 32, left: 32, top: 12, bottom: 12),
              // Foreground color
              onPrimary: Theme.of(context).colorScheme.onPrimary,
              // Background color
              primary: Theme.of(context).colorScheme.primary,
            ),
            onPressed: () => controller.signUp(
                email: email.text,
                password: password.text,
                repass: repass.text),
            child: Text('Sign up'.tr),
          ),
          const SizedBox(
            height: 48,
          )
        ],
      ),
    );
  }
}
