import 'package:e_book_app/presetations/admin/categorys/controller/categories_controller.dart';
import 'package:e_book_app/presetations/home/controllers/home_controller.dart';
import 'package:e_book_app/presetations/library/controller/download_controller.dart';
import 'package:e_book_app/presetations/library/controller/fav_controller.dart';
import 'package:e_book_app/presetations/library/controller/progress_controller.dart';
import 'package:e_book_app/presetations/store/controllers/store_controller.dart';
import 'package:e_book_app/presetations/store/controllers/trend_book_controller.dart';
import 'package:e_book_app/presetations/user/controllers/setting_controller.dart';
import 'package:e_book_app/presetations/user/controllers/user_controller.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => UserController(),
    );
    Get.put(FavBookController());
    Get.put(DownloadController());
    Get.put(ProgressController());
    Get.put(CategoriesController());
    Get.put(StoreController());
    Get.put(TrendBookController());
    Get.put(SettingController());
    Get.put(HomeController());
  }
}
