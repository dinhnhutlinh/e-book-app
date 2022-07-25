import 'package:e_book_app/presetations/home/controllers/home_controller.dart';
import 'package:e_book_app/presetations/library/pages/lib_page.dart';
import 'package:e_book_app/presetations/store/pages/store_pages.dart';
import 'package:e_book_app/presetations/user/pages/setting_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class HomePage extends GetView<HomeController> {
  static const route = '/Home';

  const HomePage({Key? key}) : super(key: key);
  _checkPermision() async {
    PermissionStatus permission = await Permission.storage.status;

    if (permission != PermissionStatus.granted) {
      await Permission.storage.request();
      // access media location needed for android 10/Q
      await Permission.accessMediaLocation.request();
      // manage external storage needed for android 11/R
      await Permission.manageExternalStorage.request();
    }
  }

  @override
  Widget build(BuildContext context) {
    _checkPermision();
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Obx(
        () => IndexedStack(index: controller.currcentPage, children: const [
          StorePage(),
          LibPage(),
          SettingPage(),
        ]),
      ),
      bottomNavigationBar: Obx(
        () => NavigationBar(
          labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
          onDestinationSelected: controller.changePage,
          destinations: [
            NavigationDestination(
              icon: const Icon(Icons.storefront),
              label: 'Store'.tr,
            ),
            NavigationDestination(
              icon: const Icon(Icons.library_books),
              label: 'Library'.tr,
            ),
            NavigationDestination(
              icon: const Icon(Icons.settings),
              label: 'Setting'.tr,
            ),
          ],
          selectedIndex: controller.currcentPage,
        ),
      ),
    );
  }
}
