import 'package:e_book_app/presetations/home/controllers/home_controller.dart';
import 'package:e_book_app/presetations/library/pages/lib_page.dart';
import 'package:e_book_app/presetations/store/pages/store_pages.dart';
import 'package:e_book_app/presetations/user/pages/setting_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends GetView<HomeController> {
  static const route = '/Home';

  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
