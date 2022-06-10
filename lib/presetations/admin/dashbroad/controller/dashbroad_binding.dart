import 'package:e_book_app/presetations/admin/categorys/controller/categories_controller.dart';
import 'package:e_book_app/presetations/admin/dashbroad/controller/dashbroad_controller.dart';
import 'package:get/get.dart';

class DashbroadBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(CategoriesController());
    Get.put(DashbroadController());
  }
}
