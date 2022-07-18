import 'package:e_book_app/presetations/home/controllers/home_controller.dart';
import 'package:e_book_app/presetations/store/pages/store_pages.dart';
import 'package:e_book_app/presetations/user/pages/user_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  static const route = '/Home';

  HomePage({Key? key}) : super(key: key);

  final _homeController = Get.find<HomeController>();

  final _pages = [
    StorePage(),
    StorePage(),
    // StorePage(),
    UserDetailPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Obx(
        () =>
            IndexedStack(index: _homeController.currcentPage, children: _pages),
      ),
      bottomNavigationBar: Obx(
        () => NavigationBar(
          labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
          onDestinationSelected: _homeController.changePage,
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            NavigationDestination(
              icon: Icon(Icons.library_books),
              label: 'Home',
            ),
            NavigationDestination(
              icon: Icon(Icons.settings),
              label: 'Home',
            ),
          ],
          selectedIndex: _homeController.currcentPage,

          // currentIndex: _homeController.currcentPage,
          // onTap: _homeController.changePage,
          // // onTap: (index) => _homeController.signOut(),
          // backgroundColor: AppColors.blueBackground,
          // selectedItemColor: AppColors.deepOrange,
          // showUnselectedLabels: false,
          // items: const [
          //   BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
          //   BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
          //   BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
          // ],
        ),
      ),
    );
  }
}
