import 'dart:async';

import 'package:e_book_app/models/book.dart';
import 'package:e_book_app/models/category.dart';
import 'package:e_book_app/presetations/store/widget/book_widget.dart';
import 'package:e_book_app/services/book_service.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class BookByCategoryList extends StatefulWidget {
  final Category category;

  const BookByCategoryList({super.key, required this.category});

  @override
  State<BookByCategoryList> createState() => _BookByCategoryListState();
}

class _BookByCategoryListState extends State<BookByCategoryList> {
  final _bookService = Get.find<BookService>();

  int paging = 0;

  final _maxBook = 10;

  final limit = 10;

  final List<Book> _books = [];

  Timer? _timer;

  @override
  void initState() {
    super.initState();
    loadBook();
  }

  loadBook() async {
    final books = await _bookService.loadBookByCat(
        categoryId: widget.category.id ?? '',
        paging: paging,
        limit: limit,
        // limit: _maxBook - _books.length > limit
        //     ? limit
        //     : _maxBook - _books.length,
        currnerIndex: _books.length);
    for (var book in books) {
      _timer = Timer(const Duration(milliseconds: 300), () {
        setState(() {
          _books.add(book);
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 192,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _books.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: BookWidget(
            book: _books[index],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
