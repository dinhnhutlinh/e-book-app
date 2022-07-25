import 'package:e_book_app/presetations/auth/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmailInputPopup extends GetView<AuthController> {
  final email = TextEditingController();

  EmailInputPopup({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: Text('Forget password'.tr),
      children: [
        Padding(
          padding: const EdgeInsets.all(12),
          child: TextField(
            controller: email,
            decoration: InputDecoration(
              labelText: 'Email'.tr,
              border: const OutlineInputBorder(),
            ),
          ),
        ),
        ButtonBar(
          children: [
            TextButton(
              onPressed: () {
                Get.back();
                controller.forgetPassword(email.text);
              },
              child: Text('Submit'.tr),
            )
          ],
        )
      ],
    );
  }
}
