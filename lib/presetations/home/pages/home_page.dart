import 'package:e_book_app/presetations/home/controllers/home_controller.dart';
import 'package:e_book_app/presetations/library/pages/lib_page.dart';
import 'package:e_book_app/presetations/store/pages/store_pages.dart';
import 'package:e_book_app/presetations/user/pages/user_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends GetView<HomeController> {
  static const route = '/Home';

  HomePage({Key? key}) : super(key: key);

  final _pages = [
    const StorePage(),
    const LibPage(),
    // StorePage(),
    UserDetailPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Obx(
        () => IndexedStack(index: controller.currcentPage, children: _pages),
      ),
      bottomNavigationBar: Obx(
        () => NavigationBar(
          labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
          onDestinationSelected: controller.changePage,
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            NavigationDestination(
              icon: Icon(Icons.library_books),
              label: 'Library',
            ),
            NavigationDestination(
              icon: Icon(Icons.settings),
              label: 'User',
            ),
          ],
          selectedIndex: controller.currcentPage,
        ),
      ),
    );
  }
}
