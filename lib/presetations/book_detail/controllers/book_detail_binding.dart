import 'package:e_book_app/presetations/book_detail/controllers/book_detail_controller.dart';
import 'package:get/instance_manager.dart';

class BookDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(BookDetailController());
  }
}
