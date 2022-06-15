import 'package:advance_pdf_viewer_fork/advance_pdf_viewer_fork.dart';
import 'package:e_book_app/presetations/reading/controller/book_viewer_c%E1%BB%8Dntroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookViewerPage extends StatelessWidget {
  static const route = '/BookViewer';
  final _controller = Get.put(BookViewerController());

  BookViewerPage({Key? key}) : super(key: key);

  Widget _bodyConteet() {
    return Obx(() {
      switch (_controller.state) {
        case PageState.error:
          return const Center(
            child: Text('Error'),
          );

        case PageState.loaded:
          return PDFViewer(
            document: _controller.document!,
            enableSwipeNavigation: true,
            showNavigation: false,
            showIndicator: false,
            showPicker: false,
            lazyLoad: false,
          );

        default:
          return const CircularProgressIndicator();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: _bodyConteet(),
    );
  }
}
