import 'dart:io';

import 'package:e_book_app/models/book.dart';
import 'package:e_book_app/models/category.dart';
import 'package:e_book_app/presetations/admin/books/controller/books_controller.dart';
import 'package:e_book_app/services/book_service.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class BookEditController extends GetxController {
  Book book = Get.arguments;
  final _bookService = Get.find<BookService>();

  Rxn<File> localImage = Rxn<File>();
  late TextEditingController name;
  Rxn<File> fileLocal = Rxn();
  Rxn<Category> category = Rxn();
  late TextEditingController author;
  late TextEditingController content;
  late TextEditingController price;
  final _imagePicker = ImagePicker();

  @override
  void onInit() {
    name = TextEditingController(text: book.name ?? '');
    author = TextEditingController(text: book.author ?? '');
    category.value = book.category;
    price = TextEditingController(text: '${book.price}');
    content = TextEditingController(text: book.content ?? '');
    super.onInit();
  }

  Future<void> pickImage() async {
    final image = await _imagePicker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      localImage.value = File(image.path);
    }
  }

  Future<void> selectFilePdf() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );
    if (result != null) {
      fileLocal.value = File(result.files.single.path!);
    }
  }

  Future<void> submit() async {
    String linkImg;
    String linkPdf;
    EasyLoading.show();
    try {
      if (localImage.value != null) {
        linkImg = await _bookService.uploadImage(
            image: localImage.value!, bookId: book.id ?? '');
      } else {
        linkImg = book.linkImgOnl ?? '';
      }
      if (fileLocal.value != null) {
        linkPdf = await _bookService.uploadPdf(
            pdf: fileLocal.value!, bookId: book.id ?? '');
      } else {
        linkPdf = book.linkfileOnl ?? '';
      }
      final temp = book.copyWith(
          name: name.text,
          category: category.value,
          author: author.text,
          content: content.text,
          linkImgOnl: linkImg,
          linkfileOnl: linkPdf,
          updateAt: DateTime.now(),
          price: int.parse(
            price.text,
            onError: (source) => 0,
          ));
      _bookService.updataBook(book: temp);
      Get.find<BooksController>().addBook(book: temp);
      EasyLoading.dismiss();
      Get.back();
      await EasyLoading.showSuccess('Success'.tr);
    } catch (e) {
      EasyLoading.dismiss();
      EasyLoading.showError('Error'.tr);
    }
  }
}
