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
      appBar: AppBar(),
      body: controller.obx(
        (state) => SfPdfViewer.file(
          controller.file,
          controller: controller.pdfController,
          pageLayoutMode: PdfPageLayoutMode.single,
          scrollDirection: PdfScrollDirection.horizontal,
          onPageChanged: (details) =>
              controller.saveProgress(details.newPageNumber),
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
