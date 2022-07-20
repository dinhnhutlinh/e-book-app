import 'dart:io';

import 'package:dio/dio.dart';
import 'package:e_book_app/models/book.dart';
import 'package:e_book_app/models/download_model.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart' hide Response;
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

class DownloadController extends GetxController {
  List<DownloadModel> downloads = [];

  @override
  Future<void> onInit() async {
    _getDownload();
    super.onInit();
  }

  _getDownload() async {
    Box db = await Hive.openBox('app');
    downloads.clear();
    downloads.addAll(db.get('Download', defaultValue: []));
  }

  addDownload(Book book) async {
    Directory dir = await getApplicationDocumentsDirectory();
    String path = dir.path;

    String pathFile = '$path/${book.id}.pdf';
    download2(Dio(), book.url ?? '', pathFile);
    downloads.add(DownloadModel(bookId: book.id ?? '', location: pathFile));
    Box db = await Hive.openBox('app');
    db.put('Download', downloads);
  }

  removeDownload(Book book) {}
  Future download2(Dio dio, String url, String savePath) async {
    try {
      Response response = await dio.get(url,
          onReceiveProgress: showDownloadProgress,
          //Received data with List<int>
          options: Options(
            responseType: ResponseType.bytes,
            followRedirects: false,
          ));
      EasyLoading.dismiss();
      File file = File(savePath);
      var raf = file.openSync(mode: FileMode.write);
      // response.data is List<int> type
      raf.writeFromSync(response.data);
      await raf.close();
    } catch (e) {
      print(e);
    }
  }

  void showDownloadProgress(received, total) {
    if (total != -1) {
      EasyLoading.showProgress((received / total * 100));
    }
  }
}
