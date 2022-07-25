import 'package:e_book_app/models/book.dart';
import 'package:e_book_app/presetations/admin/categorys/controller/categories_controller.dart';
import 'package:e_book_app/presetations/store/controllers/trend_book_controller.dart';
import 'package:e_book_app/services/book_service.dart';
import 'package:get/get.dart';

class StoreController extends GetxController with StateMixin {
  final _bookService = Get.find<BookService>();
  final RxList<Book> _books = <Book>[].obs;

  final RxBool _isLoadMore = true.obs;
  final int paging = 15;

  @override
  Future<void> onInit() async {
    await fetchBook();
    if (!Get.find<TrendBookController>().initialized) {
      await Get.find<TrendBookController>().onInit();
    }
    if (!Get.find<CategoriesController>().initialized) {
      await Get.find<CategoriesController>().onInit();
    }
    change(null, status: RxStatus.success());
    super.onInit();
  }

  fetchBook() async {
    await _bookService
        .getBooks(index: books.length, padding: paging)
        .then((value) {
      _isLoadMore.value = false;
      books.addAll(value);
    });
  }

  List<Book> get books => _books;
  bool get isLoadMore => _isLoadMore.value;
}
