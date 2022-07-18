import 'package:e_book_app/presetations/searching/controller/searching_controller.dart';
import 'package:get/get.dart';

class SearchingBookBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SearchingController());
  }
}
