import 'package:e_book_app/presetations/store/controllers/list_book_controller.dart';
import 'package:e_book_app/presetations/store/widget/book_widget.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class BookByCategoryList extends StatelessWidget {
  final String categoryId;
  final ListBookController _controller;

  BookByCategoryList({super.key, required this.categoryId})
      : _controller = Get.put(ListBookController(categoryId: categoryId),
            tag: categoryId);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 192,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _controller.books.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: BookWidget(
            book: _controller.books[index],
          ),
        ),
      ),
    );
  }
}
