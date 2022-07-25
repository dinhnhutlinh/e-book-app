import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_book_app/assets.gen.dart';
import 'package:e_book_app/presetations/admin/dashboard/pages/dashbroad_page.dart';
import 'package:e_book_app/presetations/auth/controllers/auth_controller.dart';
import 'package:e_book_app/presetations/library/controller/download_controller.dart';
import 'package:e_book_app/presetations/user/controllers/setting_controller.dart';
import 'package:e_book_app/presetations/user/controllers/user_controller.dart';
import 'package:e_book_app/presetations/user/widgets/download_manager.dart';
import 'package:e_book_app/presetations/user/pages/user_edit_profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingPage extends StatelessWidget {
  // final controller = Get.find<UserController>();
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorScheme.secondaryContainer,
        title: Text('Setting'.tr),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 32,
              width: 32,
              child: CircleAvatar(
                child: ClipOval(
                  child: Obx(() => Get.find<UserController>().profile != null
                      ? CachedNetworkImage(
                          imageUrl:
                              Get.find<UserController>().profile?.avatar ?? '',
                          width: 32,
                          height: 32,
                          fit: BoxFit.cover,
                          placeholder: (context, url) =>
                              const CircularProgressIndicator(),
                          errorWidget: (context, url, error) =>
                              Assets.resources.icons.user.svg(),
                        )
                      : const CircularProgressIndicator()),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Get.find<UserController>().obx(
        onLoading: const Center(child: CircularProgressIndicator()),
        (status) => ListView(
          children: [
            if (Get.find<UserController>().profile?.isAdmin ?? false)
              ListTile(
                leading: const Icon(Icons.space_dashboard),
                title: Text(
                  'Dashboard'.tr,
                  style: textTheme.titleMedium,
                ),
                onTap: () => Get.offAllNamed(DashboardPage.name),
              ),
            ListTile(
              leading: const Icon(Icons.account_box_outlined),
              title: Text(
                'User information'.tr,
                style: textTheme.titleMedium,
              ),
              onTap: () => Get.toNamed(UserEditProfile.route),
            ),
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
                  Get.find<SettingController>().themeMode.name.tr,
                ),
              ),
              onTap: Get.find<SettingController>().selectTheme,
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
        ),
      ),
    );
  }
}
