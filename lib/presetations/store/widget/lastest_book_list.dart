import 'package:e_book_app/presetations/store/controllers/list_book_controller.dart';
import 'package:e_book_app/presetations/store/widget/book_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LastestBookList extends StatelessWidget {
  final _controller = Get.put(ListBookController(), tag: 'last');

  LastestBookList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 192,
      child: Obx(
        () => ListView.builder(
          padding: const EdgeInsets.only(
            left: 12,
          ),
          scrollDirection: Axis.horizontal,
          itemCount: _controller.books.length,
          itemBuilder: (context, index) =>
              BookWidget(book: _controller.books[index]),
        ),
      ),
    );
  }
}
