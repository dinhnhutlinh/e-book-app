import 'package:e_book_app/models/category.dart';
import 'package:e_book_app/services/book_service.dart';
import 'package:e_book_app/services/category_services.dart';
import 'package:get/get.dart';

class StoreController extends GetxController {
  final _categoryService = Get.find<CategoryService>();
  final _bookService = Get.find<BookService>();

  final RxList<Category> _catgorys = <Category>[].obs;

  @override
  Future<void> onInit() async {
    final cats = await _categoryService.getAll();

    for (Category cat in cats) {
      _catgorys.add(cat);
      await Future.delayed(const Duration(seconds: 2));
    }
    super.onInit();
  }

  List<Category> get category => _catgorys;
}
