// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:e_book_app/models/book.dart';
import 'package:e_book_app/services/book_service.dart';
import 'package:get/get.dart';

class ListBookController extends GetxController with StateMixin {
  final String? categoryId;
  final _bookService = Get.find<BookService>();
  final limit = 5;
  final RxList<Book> _books = <Book>[].obs;

  ListBookController({
    this.categoryId,
  });
  @override
  void onInit() {
    super.onInit();
    _fetchData();
  }

  _fetchData() {
    if (categoryId != null) {
      _bookService
          .loadBookByCat(
              categoryId: categoryId!,
              paging: 0,
              limit: limit,
              currnerIndex: _books.length)
          .then((value) {
        _books.value = value;
      });
    } else {
      _bookService
          .loadLastBook(paging: 0, limit: 20, currnerIndex: _books.length)
          .then((value) {
        _books.value = value;
      });
    }
  }

  List<Book> get books => _books;
}
