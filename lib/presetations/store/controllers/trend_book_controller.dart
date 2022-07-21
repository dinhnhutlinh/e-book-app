import 'package:e_book_app/models/book.dart';
import 'package:e_book_app/services/book_service.dart';
import 'package:get/get.dart';

class TrendBookController extends GetxController with StateMixin {
  final _bookService = Get.find<BookService>();
  List<Book> books = [];
  @override
  Future<void> onInit() async {
    books = await _bookService.getTrendBook();
    change(null, status: RxStatus.success());
    super.onInit();
  }
}
