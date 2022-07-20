import 'package:e_book_app/models/book.dart';
import 'package:e_book_app/models/category.dart';
import 'package:e_book_app/services/book_service.dart';
import 'package:e_book_app/services/category_services.dart';
import 'package:get/get.dart';

class SearchingController extends GetxController with StateMixin {
  final _bookService = Get.find<BookService>();
  final _categoryService = Get.find<CategoryService>();

  final RxList<Book> _resultWithQuery = <Book>[].obs;
  final RxList<Category> _categories = <Category>[].obs;
  @override
  Future<void> onInit() async {
    _categories.addAll(await _categoryService.getAll());
    change(null, status: RxStatus.empty());
    super.onInit();
  }

  void searchWithQuery(String query) async {
    if (query == '') {
      return;
    }
    change(null, status: RxStatus.loading());
    _bookService.searchWithQuery(query: query).then((value) {
      _resultWithQuery.value = value;
      change(null, status: RxStatus.success());
    }).onError((error, stackTrace) {
      _resultWithQuery.clear();
    });
  }

  List<Book> get book => _resultWithQuery;
  List<Category> get categories => _categories;

  void refreshResult() {
    _resultWithQuery.clear();
    change(null, status: RxStatus.empty());
  }
}
