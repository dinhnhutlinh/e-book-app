import 'package:e_book_app/data/repositories/auth_repository.dart';
import 'package:e_book_app/injection.dart';
import 'package:e_book_app/presetations/auth/pages/sign_in_page.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final AuthRepository _repository = getIt<AuthRepository>();
  final RxInt _currentIndex = 0.obs;

  void signOut() {
    _repository.signOut();
    Get.offAllNamed(SignInPage.route);
  }

  void changePage(int index) => _currentIndex.value = index;

  int get currcentPage => _currentIndex.value;
}
