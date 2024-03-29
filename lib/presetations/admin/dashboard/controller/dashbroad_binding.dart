import 'package:e_book_app/presetations/admin/books/controller/books_controller.dart';
import 'package:e_book_app/presetations/admin/categorys/controller/categories_controller.dart';
import 'package:e_book_app/presetations/admin/dashboard/controller/dashbroad_controller.dart';
import 'package:e_book_app/presetations/user/controllers/user_controller.dart';
import 'package:get/get.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UserController());
    Get.lazyPut(() => BooksController());
    Get.lazyPut(() => CategoriesController());
    Get.put(DashboardController());
  }
}
