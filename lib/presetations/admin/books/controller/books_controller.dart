import 'package:e_book_app/models/book.dart';
import 'package:e_book_app/services/book_service.dart';
import 'package:e_book_app/utils/vn_charactor_util.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class BooksController extends GetxController {
  static const route = '/Books';
  final _bookServices = Get.find<BookService>();

  List<Book> _books = <Book>[];
  final RxString _query = ''.obs;
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
    super.onInit();
  }

  Future<void> changeURLBook() async {
    final storageRef = FirebaseStorage.instance.ref();
    for (var book in _books) {
      final imageRef = storageRef.child(
          'images/image-${VnCharactorUtil.removeAccent(book.name ?? '')}.png');
      final thumbnailRef = storageRef.child(
          'thumbnail/thumbnail-${VnCharactorUtil.removeAccent(book.name ?? '')}.png');

      book.linkImgOnl = await imageRef.getDownloadURL();
      book.linkThumbnail = await thumbnailRef.getDownloadURL();

      _bookServices.updataBook(book: book);
    }
  }

  bool get wasLoad => _wasLoad.value;

  Future<void> fetchData() async {
    _wasLoad.value = false;
    _books = await _bookServices.getAllBook();
    _wasLoad.value = true;
  }

  void query(String value) {
    _query.value = value;
  }

  List<Book> get books => _books
      .where((element) => element.name?.contains(_query.value) ?? false)
      .toList();
  bool get isVisibleFloatButton => _isShowFloatButton.value;
}
