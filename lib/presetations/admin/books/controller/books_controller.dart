import 'package:e_book_app/models/book.dart';
import 'package:e_book_app/services/book_service.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class BooksController extends GetxController {
  static const route = '/Books';
  final _bookServices = Get.find<BookService>();

  final RxList<Book> _books = <Book>[].obs;
  final RxBool _wasLoad = false.obs;

  final scollController = ScrollController();
  final RxBool _isShowFloatButton = true.obs;

  @override
  Future<void> onInit() async {
    scollController.addListener(() {
      if (scollController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        _isShowFloatButton.value = false;
      }
      if (scollController.position.userScrollDirection ==
          ScrollDirection.forward) {
        _isShowFloatButton.value = true;
      }
    });

    await fetchData();
    // changeURLBook();

    super.onInit();
  }

  // Future<void> changeURLBook() async {
  //   final storageRef = FirebaseStorage.instance.ref();
  //   for (var book in _books) {
  //     final imageRef = storageRef.child(
  //         'images/image-${VnCharactorUtil.removeAccent(book.name ?? '')}');

  //     book.linkImgOnl = await imageRef.getDownloadURL();

  //     _bookServices.updataBook(book: book);
  //   }
  // }

  bool get wasLoad => _wasLoad.value;

  Future<void> fetchData() async {
    _wasLoad.value = false;
    _books.value = await _bookServices.getAllBook();
    _wasLoad.value = true;
  }

  void query(String value) {
    _books.value = _books
        .where((element) => element.name?.contains(value) ?? false)
        .toList();
  }

  List<Book> get books => _books;
  bool get isVisibleFloatButton => _isShowFloatButton.value;
}
