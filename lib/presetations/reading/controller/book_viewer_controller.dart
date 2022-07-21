import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:e_book_app/models/book.dart';
import 'package:e_book_app/presetations/library/controller/download_controller.dart';
import 'package:e_book_app/presetations/library/controller/progress_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class BookViewerController extends GetxController with StateMixin {
  final _downloadController = Get.find<DownloadController>();
  final _progressController = Get.find<ProgressController>();
  final Book book = Get.arguments;
  late Uint8List _pdfData;

  late String _pathFile;

  PdfViewerController pdfController = PdfViewerController();

  Future<Uint8List> createFileOfPdfUrl(String url) async {
    var request = await HttpClient().getUrl(Uri.parse(url));
    var response = await request.close();
    var bytes = await consolidateHttpClientResponseBytes(response);
    return bytes;
  }

  Future<Uint8List> loadFileFromLocal(String path) async {
    final file = File(path);
    return await file.readAsBytes();
  }

  @override
  Future<void> onInit() async {
    super.onInit();

    change(null, status: RxStatus.loading());
    pdfController
        .jumpToPage(await _progressController.getProgressBook(book.id ?? ''));
    _pathFile = _downloadController.getPathLocalOfBook(bookId: book.id ?? '');
    change(null, status: RxStatus.success());
    // await loadFileFromLocal(path).then((value) {
    //   _pdfData = value;
    //   change(null, status: RxStatus.success());
    // }).onError((error, stackTrace) {
    //   change(null, status: RxStatus.error());
    // });
  }

  Uint8List get data => _pdfData;
  String get pathFile => _pathFile;

  saveProgress(int newPageNumber) {
    _progressController.addProgressBook(book.id ?? '', newPageNumber);
  }
}
