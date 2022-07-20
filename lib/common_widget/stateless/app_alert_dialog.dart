// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppAlertDialog {
  static show(
      {required String title,
      String? content,
      Function? onCancel,
      Function? onConfirm,
      String? textCancel,
      String? textConfirm}) {
    showDialog(
      context: Get.context!,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(content ?? ''),
        actions: [
          TextButton(
            onPressed: () {
              Get.back();
              onCancel?.call();
            },
            child: Text(textCancel ?? 'Huỷ'),
          ),
          if (textConfirm != null)
            TextButton(
              onPressed: () {
                Get.back();
                onConfirm?.call();
              },
              child: Text(textConfirm),
            )
        ],
      ),
    );
  }
}
