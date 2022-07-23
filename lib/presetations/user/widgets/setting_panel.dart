import 'package:e_book_app/presetations/auth/controllers/auth_controller.dart';
import 'package:e_book_app/presetations/library/controller/download_controller.dart';
import 'package:e_book_app/presetations/user/controllers/setting_controller.dart';
import 'package:e_book_app/presetations/user/widgets/download_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingPanel extends GetView<SettingController> {
  const SettingPanel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return ListView(
      children: [
        ListTile(
          leading: const Icon(Icons.file_download_done_outlined),
          title: Text(
            'Storage manager'.tr,
            style: textTheme.titleMedium,
          ),
          trailing: Obx(
            () => Text(
              '${Get.find<DownloadController>().books.length}',
            ),
          ),
          onTap: () => Get.bottomSheet(const DownloadManager()),
        ),
        ListTile(
          leading: const Icon(Icons.settings_display_outlined),
          title: Text(
            'Theme'.tr,
            style: textTheme.titleMedium,
          ),
          trailing: Obx(
            () => Text(
              controller.themeMode.name.tr,
            ),
          ),
          onTap: controller.selectTheme,
        ),
        ListTile(
          leading: const Icon(Icons.logout_outlined),
          title: Text(
            'Log out'.tr,
            style: textTheme.titleMedium,
          ),
          onTap: () => Get.find<AuthController>().signOut(),
        )
      ],
    );
  }
}
