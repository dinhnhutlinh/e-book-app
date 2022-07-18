import 'package:e_book_app/models/book.dart';
import 'package:e_book_app/models/category.dart';
import 'package:e_book_app/services/book_service.dart';
import 'package:e_book_app/services/category_services.dart';
import 'package:get/get.dart';

class StoreController extends GetxController with StateMixin {
  final _categoryService = Get.find<CategoryService>();
  final _bookService = Get.find<BookService>();

  final RxList<Category> _catgories = <Category>[].obs;
  final RxList<Book> _books = <Book>[].obs;

  final RxBool _isLoadMore = true.obs;
  final int paging = 5;

  @override
  Future<void> onInit() async {
    await fetchCategories();
    await fetchBook();
    super.onInit();
  }

  fetchCategories() async {
    change(null, status: RxStatus.loading());
    await _categoryService.getAll().then((value) {
      _catgories.value = value;
      change(null, status: RxStatus.success());
    }).onError((error, stackTrace) {
      change(null, status: RxStatus.error());
    });
  }

  fetchBook() {
    _bookService.getBooks(index: books.length, padding: paging).then((value) {
      _isLoadMore.value = false;
      books.addAll(value);
    });
  }

  List<Category> get categories => _catgories;
  List<Book> get books => _books;
  bool get isLoadMore => _isLoadMore.value;
}
