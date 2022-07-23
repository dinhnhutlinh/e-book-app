import 'package:e_book_app/models/book.dart';
import 'package:e_book_app/presetations/library/controller/progress_controller.dart';
import 'package:e_book_app/presetations/library/widget/book_progress.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReadingProgress extends GetView<ProgressController> {
  const ReadingProgress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return controller.obx(
        (state) => Obx(
              () => controller.progressModel.isEmpty
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
                        for (Book book in controller.books)
                          BookProgress(
                              book: book,
                              pages: controller.getProgressBook(book.id ?? '')),
                      ],
                    ),
            ),
        onLoading: const Center(
          child: CircularProgressIndicator(),
        ));
  }
}
