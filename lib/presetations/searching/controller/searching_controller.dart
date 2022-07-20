import 'package:e_book_app/models/book.dart';
import 'package:e_book_app/services/book_service.dart';
import 'package:get/get.dart';

class SearchingController extends GetxController with StateMixin {
  final _bookService = Get.find<BookService>();
  final RxList<Book> _resultWithQuery = <Book>[].obs;

  @override
  void onInit() {
    change(null, status: RxStatus.empty());
    super.onInit();
  }

  void searchWithQuery(String query) async {
    change(null, status: RxStatus.loading());
    _bookService.searchWithQuery(query: query).then((value) {
      _resultWithQuery.value = value;
      print(value);
      change(null, status: RxStatus.success());
    }).onError((error, stackTrace) {
      _resultWithQuery.clear();
    });
  }

  List<Book> get book => _resultWithQuery;

  void refreshResult() {
    _resultWithQuery.clear();
    change(null, status: RxStatus.empty());
  }
}
