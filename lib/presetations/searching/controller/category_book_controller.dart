import 'package:e_book_app/models/book.dart';
import 'package:e_book_app/models/category.dart';
import 'package:e_book_app/presetations/searching/widgets/select_filter_bts.dart';
import 'package:e_book_app/services/book_service.dart';
import 'package:get/get.dart';

class CategoryBookController extends GetxController with StateMixin {
  final _bookService = Get.find<BookService>();
  final Category categoy = Get.arguments;
  final RxList<Book> book = <Book>[].obs;
  final RxString sortBy = 'Default'.obs;

  @override
  void onInit() {
    change(null, status: RxStatus.loading());
    _bookService.bookOfCategory(categoyId: categoy.id).then((value) {
      book.addAll(value);
      sortById();
      change(null, status: RxStatus.success());
    });
    super.onInit();
  }

  void selectFilter() {
    Get.bottomSheet(const SelectFilterBTS());
  }

  void sortByDate() {
    sortBy.value = 'Date';
    book.sort((a, b) => a.updateAt!.compareTo(b.updateAt!));
  }

  void sortById() {
    sortBy.value = 'Default';
    book.sort((a, b) => a.id!.compareTo(b.id!));
  }

  void sortByName() {
    sortBy.value = 'Name';
    book.sort((a, b) => a.name!.compareTo(b.name!));
  }
}
