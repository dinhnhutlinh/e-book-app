import 'package:e_book_app/presetations/auth/pages/sign_in_page.dart';
import 'package:e_book_app/services/auth_service.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final _auhtService = Get.find<AuthService>();
  final RxInt _currentIndex = 0.obs;

  void signOut() {
    _auhtService.signOut();
    Get.offAllNamed(SignInPage.route);
  }

  void changePage(int index) => _currentIndex.value = index;

  int get currcentPage => _currentIndex.value;
}
