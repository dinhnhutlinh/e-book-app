import 'package:e_book_app/services/auth_service.dart';
import 'package:e_book_app/services/category_services.dart';
import 'package:e_book_app/services/user_services.dart';
import 'package:get/get.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthService());
    Get.put(UserService());
    Get.put(CategoryService());
  }
}
