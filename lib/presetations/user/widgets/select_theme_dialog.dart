import 'package:e_book_app/presetations/user/controllers/setting_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelectThemeDialog extends GetView<SettingController> {
  const SelectThemeDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: Text('Select theme'.tr),
      children: [
        Column(
          children: [
            ListTile(
              leading: Icon(controller.themeMode == ThemeMode.system
                  ? Icons.radio_button_checked
                  : Icons.radio_button_off),
              title: Text(ThemeMode.system.name.tr),
              onTap: () {
                controller.setTheme(ThemeMode.system);
                Get.back();
              },
            ),
            ListTile(
              leading: Icon(controller.themeMode == ThemeMode.light
                  ? Icons.radio_button_checked
                  : Icons.radio_button_off),
              title: Text(ThemeMode.light.name.tr),
              onTap: () {
                controller.setTheme(ThemeMode.light);
                Get.back();
              },
            ),
            ListTile(
              leading: Icon(controller.themeMode == ThemeMode.dark
                  ? Icons.radio_button_checked
                  : Icons.radio_button_off),
              title: Text(ThemeMode.dark.name.tr),
              onTap: () {
                controller.setTheme(ThemeMode.dark);
                Get.back();
              },
            ),
            ButtonBar(
              children: [
                OutlinedButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: Text('Cancel'.tr),
                )
              ],
            )
          ],
        )
      ],
    );
  }
}
