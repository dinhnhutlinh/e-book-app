import 'package:e_book_app/presetations/library/controller/fav_controller.dart';
import 'package:get/instance_manager.dart';

class LibBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(FavBookController());
  }
}
