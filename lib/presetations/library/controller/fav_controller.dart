import 'package:e_book_app/models/book.dart';
import 'package:e_book_app/presetations/user/controllers/user_controller.dart';
import 'package:e_book_app/services/book_service.dart';
import 'package:get/get.dart';

class FavBookController extends GetxController with StateMixin {
  final _bookService = Get.find<BookService>();

  final RxList<Book> _favBooks = <Book>[].obs;

  @override
  Future<void> onInit() async {
    change(null, status: RxStatus.loading());
    await _fetchBook();
    change(null, status: RxStatus.success());
    super.onInit();
  }

  _fetchBook() async {
    List<Book> books =
        await _bookService.favoriteBook(uid: Get.find<UserController>().uid);
    _favBooks.addAll(books);
  }

  bool checkFavBook(String bookid) {
    return _favBooks.any((book) => book.id == bookid);
  }

  addFavBook({required Book book}) {
    _favBooks.add(book);
    _bookService.likeBook(
        bookId: book.id ?? '', userId: Get.find<UserController>().uid);
  }

  removeFavBook({required Book book}) {
    _favBooks.removeWhere((element) => book.id == element.id);
    _bookService.unlikeBook(
        bookId: book.id ?? '', userId: Get.find<UserController>().uid);
  }

  List<Book> get farBooks => _favBooks;
}
