import 'package:e_book_app/presetations/store/controllers/list_book_controller.dart';
import 'package:e_book_app/presetations/user/controllers/user_controller.dart';
import 'package:e_book_app/services/auth_service.dart';
import 'package:e_book_app/services/book_service.dart';
import 'package:e_book_app/services/category_services.dart';
import 'package:e_book_app/services/db_service.dart';
import 'package:e_book_app/services/user_services.dart';
import 'package:get/get.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthService());
    Get.lazyPut(() => BookService());
    Get.lazyPut(() => UserService());
    Get.lazyPut(() => CategoryService());
    Get.lazyPut(() => DBService());
    Get.create(() => ListBookController());
    Get.put(UserController());
  }
}
