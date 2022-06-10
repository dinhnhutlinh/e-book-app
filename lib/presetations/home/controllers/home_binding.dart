import 'package:e_book_app/presetations/home/controllers/home_controller.dart';
import 'package:e_book_app/presetations/user/controllers/user_controller.dart';
import 'package:e_book_app/services/book_service.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(BookService());
    Get.put(HomeController());
    Get.put(UserController());
  }
}
