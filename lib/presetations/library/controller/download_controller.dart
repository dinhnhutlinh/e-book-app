import 'dart:convert';
import 'dart:io';

import 'package:e_book_app/common_widget/stateful/download_alert.dart';
import 'package:e_book_app/configs/defind.dart';
import 'package:e_book_app/models/book.dart';
import 'package:e_book_app/models/download_model.dart';
import 'package:e_book_app/services/book_service.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class DownloadController extends GetxController with StateMixin {
  final _bookService = Get.find<BookService>();

  List<DownloadModel> _downloads = [];
  final RxList<Book> _downloadedBook = <Book>[].obs;

  @override
  Future<void> onInit() async {
    await _getDownload();
    if (_downloads.isNotEmpty) {
      await _getBookDownloads();
    }
    change(null, status: RxStatus.success());
    super.onInit();
  }

  _checkPermision() async {
    PermissionStatus permission = await Permission.storage.status;

    if (permission != PermissionStatus.granted) {
      await Permission.storage.request();
      // access media location needed for android 10/Q
      await Permission.accessMediaLocation.request();
      // manage external storage needed for android 11/R
      await Permission.manageExternalStorage.request();
    }
  }

  _getDownload() async {
    Box db = Hive.box(Define.dbName);
    _downloads.clear();
    List<String> data = db.get('Download', defaultValue: <String>[]);

    _downloads =
        data.map((e) => DownloadModel.fromJson(jsonDecode(e))).toList();
  }

  Future<bool> addDownload(Book book) async {
    _checkPermision();
    PermissionStatus permission = await Permission.storage.status;

    if (permission == PermissionStatus.granted) {
      Directory dir = await getApplicationDocumentsDirectory();
      String path = dir.path;
      String pathFile = '$path/${book.id}.pdf';
      bool? isSuccess = await Get.dialog<bool>(
          DownloadAlert(url: book.linkfileOnl ?? '', path: pathFile));
      if (isSuccess ?? false) {
        _downloads
            .add(DownloadModel(bookId: book.id ?? '', location: pathFile));

        Box db = Hive.box(Define.dbName);
        db.put('Download', _downloads.map((e) => jsonEncode(e)).toList());

        _downloadedBook.add(book);
        return true;
      }
    }
    return false;
  }

  removeDownload(Book book) async {
    DownloadModel downloadModel =
        _downloads.firstWhere((element) => element.bookId == book.id);
    File file = File(downloadModel.location);
    file.delete();

    Box db = Hive.box(Define.dbName);
    _downloads.removeWhere((element) => element.bookId == book.id);

    db.put('Download', _downloads.map((e) => jsonEncode(e)).toList());
    _downloadedBook.removeWhere((element) => element.id == book.id);
  }

  bool checkDownload({required String bookId}) {
    return _downloads.any((element) => element.bookId == bookId);
  }

  _getBookDownloads() async {
    final books = await _bookService.getBookWithIdInList(
        ids: _downloads.map((e) => e.bookId).toList());
    _downloadedBook.addAll(books);
  }

  List<Book> get books => _downloadedBook;

  String getPathLocalOfBook({required String bookId}) {
    return _downloads
        .firstWhere((element) => element.bookId == bookId)
        .location;
  }

  void removeAllFileLocal() {
    _downloads.clear();
    _downloadedBook.clear();
    for (var element in _downloads) {
      File file = File(element.location);
      file.delete();
    }
  }

  int getStorageLength() {
    var total = 0;
    for (var element in _downloads) {
      File file = File(element.location);
      total += file.lengthSync();
    }
    return total;
  }
}
