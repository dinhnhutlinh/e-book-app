import 'package:e_book_app/presetations/home/controllers/home_controller.dart';
import 'package:e_book_app/presetations/store/pages/store_pages.dart';
import 'package:e_book_app/presetations/user/pages/user_detail_page.dart';
import 'package:e_book_app/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  static const route = '/Home';

  HomePage({Key? key}) : super(key: key);

  final _homeController = Get.find<HomeController>();

  final _pages = [
    const StorePage(),
    const StorePage(),
    // StorePage(),
    UserDetailPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height,
      width: Get.width,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            AppColors.darkBlue,
            AppColors.lightBlue,
          ],
          stops: [0.0, 1.0],
          tileMode: TileMode.clamp,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Obx(
          () => IndexedStack(
              index: _homeController.currcentPage, children: _pages),
        ),
        bottomNavigationBar: Obx(
          () => BottomNavigationBar(
            currentIndex: _homeController.currcentPage,
            onTap: _homeController.changePage,
            // onTap: (index) => _homeController.signOut(),
            backgroundColor: AppColors.blueBackground,
            selectedItemColor: AppColors.deepOrange,
            showUnselectedLabels: false,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
            ],
          ),
        ),
      ),
    );
  }
}
