import 'package:e_book_app/models/user_profile.dart';
import 'package:e_book_app/presetations/admin/books/controller/books_controller.dart';
import 'package:e_book_app/presetations/admin/categorys/controller/categories_controller.dart';
import 'package:e_book_app/presetations/auth/pages/sign_in_page.dart';
import 'package:e_book_app/presetations/user/controllers/user_controller.dart';
import 'package:e_book_app/services/auth_service.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {
  final _auhtService = Get.find<AuthService>();
  final _booksController = Get.find<BooksController>();
  final _categoriesController = Get.find<CategoriesController>();
  final _userController = Get.find<UserController>();

  final RxBool _wasLoad = false.obs;

  final RxInt _countBooks = 0.obs;
  final RxInt _countCategory = 0.obs;
  int countUser = 0;
  int countUserInDay = 0;
  int countPay = 0;

  @override
  Future<void> onInit() async {
    fetchData();
    _wasLoad.value = true;
    super.onInit();
  }

  void logOut() {
    _auhtService.signOut();
    Get.offAllNamed(SignInPage.route);
  }

  UserProfile? get profile => _userController.profile;
  bool get wasLoad => _wasLoad.value;

  void fetchData() {
    _countBooks.value = _booksController.books.length;
    _countCategory.value = _categoriesController.categories.length;
  }

  int get countBook => _countBooks.value;
  int get countCategory => _countCategory.value;
}
