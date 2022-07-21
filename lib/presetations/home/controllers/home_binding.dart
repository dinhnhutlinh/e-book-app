import 'package:e_book_app/presetations/admin/categorys/controller/categories_controller.dart';
import 'package:e_book_app/presetations/home/controllers/home_controller.dart';
import 'package:e_book_app/presetations/library/controller/download_controller.dart';
import 'package:e_book_app/presetations/library/controller/fav_controller.dart';
import 'package:e_book_app/presetations/library/controller/progress_controller.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(FavBookController());
    Get.put(DownloadController());
    Get.put(ProgressController());
    Get.put(CategoriesController());
    Get.put(HomeController());
  }
}
