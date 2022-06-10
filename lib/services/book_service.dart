import 'package:e_book_app/models/book.dart';
import 'package:e_book_app/repositories/book_repository.dart';
import 'package:get/get.dart';

class BookService extends GetxService {
  final _bookRepository = BookRepository();
  List<Book> books = [];

  @override
  Future<void> onInit() async {
    super.onInit();
  }

  Future getAllBook() async {
    return books = await _bookRepository.getAllBook();
  }
}
