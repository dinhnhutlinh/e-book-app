import 'package:e_book_app/presetations/admin/dashboard/controller/dashbroad_controller.dart';
import 'package:get/get.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(DashbroadController());
  }
}
