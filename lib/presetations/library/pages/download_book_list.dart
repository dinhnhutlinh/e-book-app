import 'package:e_book_app/models/book.dart';
import 'package:e_book_app/presetations/library/controller/download_controller.dart';
import 'package:e_book_app/common_widget/stateless/book_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DownloadBooKList extends GetView<DownloadController> {
  const DownloadBooKList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return controller.obx(
      (state) => Obx(
        () => controller.books.isEmpty
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.upcoming_outlined,
                      size: 96,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Text(
                      'Empty'.tr,
                      style: Theme.of(context).textTheme.titleLarge,
                    )
                  ],
                ),
              )
            : ListView(
                children: [
                  for (Book book in controller.books) BookTile(book: book),
                ],
              ),
      ),
    );
  }
}
