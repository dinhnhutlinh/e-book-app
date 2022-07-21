import 'package:e_book_app/models/book.dart';
import 'package:e_book_app/presetations/library/controller/download_controller.dart';
import 'package:e_book_app/presetations/library/widget/book_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class DownloadBooKList extends GetView<DownloadController> {
  const DownloadBooKList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return controller.obx(
      (state) => Obx(
        () => ListView(
          children: [
            for (Book book in controller.books) BookTile(book: book),
          ],
        ),
      ),
    );
  }
}
