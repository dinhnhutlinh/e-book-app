import 'package:e_book_app/presetations/reading/controller/book_viewer_controller.dart';
import 'package:get/instance_manager.dart';

class BookViewerBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(BookViewerController());
  }
}
