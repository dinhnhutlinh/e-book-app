import 'package:advance_pdf_viewer_fork/advance_pdf_viewer_fork.dart';
import 'package:e_book_app/models/book.dart';
import 'package:get/get.dart';

enum PageState { loading, loaded, error }

class BookViewerController extends GetxController {
  final Book book = Get.arguments;
  PDFDocument? _document;
  final Rx<PageState> _state = PageState.loading.obs;

  @override
  Future<void> onInit() async {
    await PDFDocument.fromURL(book.linkfileOnl ?? '').then((value) {
      _document = value;
      _state.value = PageState.loaded;
    }).catchError((error, stackTrace) {
      _state.value = PageState.error;
    });
    super.onInit();
  }

  PageState get state => _state.value;
  PDFDocument? get document => _document;
}
