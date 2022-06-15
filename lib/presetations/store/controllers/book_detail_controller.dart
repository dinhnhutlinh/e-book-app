import 'package:e_book_app/models/book.dart';
import 'package:e_book_app/services/auth_service.dart';
import 'package:e_book_app/services/book_service.dart';
import 'package:get/get.dart';

class BookDetailController extends GetxController {
  final _bookServices = Get.find<BookService>();
  final _authServices = Get.find<AuthService>();

  Book book = Get.arguments;
  RxBool wasLoad = false.obs;

  final RxBool _wasLike = false.obs;
  @override
  Future<void> onInit() async {
    _wasLike.value = await _bookServices.wasLike(
        bookId: book.id ?? '', userId: _authServices.user?.uid ?? '');
    super.onInit();
  }

  Future<void> likeBook() async {
    await _bookServices
        .likeBook(bookId: book.id ?? '', userId: _authServices.user?.uid ?? '')
        .then((value) {
      _wasLike.value = true;
    });
  }

  Future<void> unLikeBook() async {
    await _bookServices
        .unlikeBook(
            bookId: book.id ?? '', userId: _authServices.user?.uid ?? '')
        .then((value) {
      _wasLike.value = false;
    });
  }

  bool get wasLike => _wasLike.value;
}
