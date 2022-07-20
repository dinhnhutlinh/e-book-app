import 'package:e_book_app/presetations/book_detail/controllers/book_detail_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class AboutThisBook extends GetView<BookDetailController> {
  const AboutThisBook({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About this book'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(
          top: 12,
          left: 12,
          right: 12,
          bottom: 12,
        ),
        child: Text(
          controller.book.content ?? '',
        ),
      ),
    );
  }
}
