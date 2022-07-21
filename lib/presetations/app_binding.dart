import 'package:e_book_app/presetations/user/controllers/user_controller.dart';
import 'package:e_book_app/services/book_service.dart';
import 'package:e_book_app/services/category_services.dart';
import 'package:e_book_app/services/user_services.dart';
import 'package:get/get.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BookService());
    Get.lazyPut(() => UserService());
    Get.lazyPut(() => CategoryService());
    Get.put(UserController());
  }
}
