import 'package:e_book_app/models/user_profile.dart';
import 'package:e_book_app/presetations/auth/pages/sign_in_page.dart';
import 'package:e_book_app/services/auth_service.dart';
import 'package:e_book_app/services/book_service.dart';
import 'package:e_book_app/services/category_services.dart';
import 'package:e_book_app/services/user_services.dart';
import 'package:get/get.dart';

class DashbroadController extends GetxController {
  final _auhtService = Get.find<AuthService>();
  final _categoryService = Get.find<CategoryService>();
  final _userService = Get.find<UserService>();
  final _bookService = Get.find<BookService>();

  final RxBool _wasLoad = false.obs;

  int countBooks = 0;
  int countCategory = 0;
  int countUser = 0;
  int countUserInDay = 0;
  int countPay = 0;

  @override
  Future<void> onInit() async {
    await fetchData();
    _wasLoad.value = true;
    super.onInit();
  }

  void logOut() {
    _auhtService.signOut();
    Get.offAllNamed(SignInPage.route);
  }

  UserProfile? get profile => _userService.profile;
  bool get wasLoad => _wasLoad.value;

  Future<void> fetchData() async {
    await _bookService.countBook().then((value) {
      countBooks = value;
    });
    await _categoryService.countCat().then(
          (value) => countCategory = value,
        );
    await _userService.countUser().then(
          (value) => countUser = value,
        );
  }
}
