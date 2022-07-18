import 'package:e_book_app/models/book.dart';
import 'package:e_book_app/services/book_service.dart';
import 'package:get/get.dart';

class SearchingController extends GetxController {
  final _bookService = Get.find<BookService>();
  final RxList<Book> _resultWithQuery = <Book>[].obs;

  Future<void> searchWithQuery(String query) async {
    await _bookService.searchWithQuery(query: query).then((value) {
      _resultWithQuery.value = value;
    }).onError((error, stackTrace) {
      _resultWithQuery.clear();
    });
  }
}
