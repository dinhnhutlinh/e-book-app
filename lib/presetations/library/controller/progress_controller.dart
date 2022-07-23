import 'dart:convert';

import 'package:e_book_app/configs/defind.dart';
import 'package:e_book_app/models/book.dart';
import 'package:e_book_app/models/progress_model.dart';
import 'package:e_book_app/services/book_service.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class ProgressController extends GetxController with StateMixin {
  final _bookService = Get.find<BookService>();
  final RxList<ProgressModel> _progresses = <ProgressModel>[].obs;
  List<Book> _books = <Book>[];

  @override
  Future<void> onInit() async {
    change(null, status: RxStatus.loading());

    _getProgressesFromDb();
    _books = await _bookService.getBookWithIdInList(
        ids: _progresses.map((e) => e.bookId).toList());
    change(null, status: RxStatus.success());
    super.onInit();
  }

  _getProgressesFromDb() {
    Box db = Hive.box(Define.dbName);
    _progresses.clear();
    List<String> data = db.get('Progress', defaultValue: <String>[]);

    _progresses.value =
        data.map((e) => ProgressModel.fromJson(jsonDecode(e))).toList();
  }

  int getProgressBook(String bookId) {
    return _progresses
        .firstWhere((element) => element.bookId == bookId,
            orElse: () => ProgressModel(bookId: '', page: 0))
        .page;
  }

  Future<void> addProgressBook(Book book, int index) async {
    if (_progresses.any((element) => element.bookId == book.id)) {
      _progresses.firstWhere((element) => element.bookId == book.id).page =
          index;
      _progresses.refresh();
    } else {
      _books.add(book);
      _progresses.add(ProgressModel(bookId: book.id ?? '', page: index));
    }

    Box db = Hive.box(Define.dbName);
    db.put('Progress', _progresses.map((e) => jsonEncode(e)).toList());
  }

  List<Book> get books => _books;
  List<ProgressModel> get progressModel => _progresses;
}
