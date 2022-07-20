import 'package:e_book_app/presetations/searching/controller/category_book_controller.dart';
import 'package:get/instance_manager.dart';

class CategoryBookBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(CategoryBookController());
  }
}
