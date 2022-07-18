import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:e_book_app/models/book.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class BookViewerController extends GetxController with StateMixin {
  final Book book = Get.arguments;
  // PDFDocument? _document;
  // late final pathSave;

  late Uint8List _pdfData;

  late int _bookLength;
  final Rx<int> _currentPage = 1.obs;

  Future<Uint8List> createFileOfPdfUrl(String url) async {
    var request = await HttpClient().getUrl(Uri.parse(url));
    var response = await request.close();
    var bytes = await consolidateHttpClientResponseBytes(response);
    return bytes;
  }

  @override
  Future<void> onInit() async {
    super.onInit();

    change(null, status: RxStatus.loading());
    await createFileOfPdfUrl(book.linkfileOnl ?? '').then((value) {
      _pdfData = value;
      change(null, status: RxStatus.success());
    }).onError((error, stackTrace) {
      change(null, status: RxStatus.error());
    });
    // pathSave = '${await getTemporaryDirectory()}/${book.id}';

    // await Dio().download(book.linkfileOnl ?? '', pathSave,
    //     onReceiveProgress: (value, total) {
    //   _progress.value = value / total * 100;
    //   print(_progress);
    // });
    // await PDFDocument.fromURL(book.linkfileOnl!).then((value) {
    //   _document = value;
    //   change(null, status: RxStatus.success());
    // }).onError((error, stackTrace) {
    //   change(null, status: RxStatus.error());
    // });
  }

  // double get progress => _progress.value;
  // PDFDocument? get document => _document;
  Uint8List get data => _pdfData;
}
