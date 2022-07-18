import 'package:e_book_app/presetations/reading/controller/book_viewer_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:get/get.dart';

class BookViewerPage extends GetView<BookViewerController> {
  static const route = '/BookViewer';

  const BookViewerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: controller.obx(
        (state) => SafeArea(
          child: Column(
            children: [
              Expanded(
                child: PDFView(
                  pdfData: controller.data,
                  swipeHorizontal: false,
                  pageFling: true,
                  pageSnap: true,
                  // nightMode: true,
                  onViewCreated: (viewController) {
                    // controller.viewController = viewController;
                  },
                ),
              ),
            ],
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
