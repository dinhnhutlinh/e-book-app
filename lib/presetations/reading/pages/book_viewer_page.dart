import 'dart:io';

import 'package:e_book_app/presetations/reading/controller/book_viewer_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class BookViewerPage extends GetView<BookViewerController> {
  static const route = '/BookViewer';

  const BookViewerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: controller.obx(
        (state) => SafeArea(
          child: SfPdfViewer.file(
            File(controller.pathFile),
            controller: controller.pdfController,
            pageLayoutMode: PdfPageLayoutMode.single,
            // canShowPaginationDialog: true,
            interactionMode: PdfInteractionMode.selection,
            onPageChanged: (details) =>
                controller.saveProgress(details.newPageNumber),
          ),
        ),
        onLoading: const Center(
          child: CircularProgressIndicator(),
        ),
        onError: (error) => Center(
          child: Text(error ?? 'Không thể tải nội dung'),
        ),
      ),
    );
  }
}
