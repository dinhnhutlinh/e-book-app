import 'package:e_book_app/presetations/auth/controllers/auth_controller.dart';
import 'package:e_book_app/presetations/home/controllers/home_controller.dart';
import 'package:e_book_app/presetations/user/controllers/_user_controller.dart';
import 'package:get/instance_manager.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthController());
    Get.put(HomeController());
    Get.lazyPut(() => UserController());
  }
}
