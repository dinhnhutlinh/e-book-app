import 'dart:async';

import 'package:e_book_app/models/book.dart';
import 'package:e_book_app/presetations/store/widget/book_widget.dart';
import 'package:e_book_app/services/book_service.dart';
import 'package:e_book_app/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class LastestBookList extends StatefulWidget {
  const LastestBookList({Key? key}) : super(key: key);

  @override
  State<LastestBookList> createState() => _LastestBookListState();
}

class _LastestBookListState extends State<LastestBookList> {
  final _bookService = Get.find<BookService>();
  int paging = 0;
  final _maxBook = 20;
  final limit = 10;
  final List<Book> _books = [];

  Timer? _timer;

  @override
  void initState() {
    super.initState();
  }

  loadBook() async {
    if (_books.length < _maxBook) {
      final books = await _bookService.loadLastBook(
          paging: paging,
          limit: _maxBook - _books.length > limit
              ? limit
              : _maxBook - _books.length,
          currnerIndex: _books.length);

      for (var book in books) {
        _timer = Timer(const Duration(milliseconds: 300), () {
          setState(() {
            _books.add(book);
          });
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Book>>(
        future: _bookService.loadLastBook(
            paging: paging, limit: limit, currnerIndex: _books.length),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return SizedBox(
              height: 192,
              child: Shimmer.fromColors(
                baseColor: AppColors.white,
                highlightColor: AppColors.deepOrange.withOpacity(1),
                child: const SizedBox(
                  height: 192,
                  width: double.infinity,
                  child: Card(margin: EdgeInsets.zero),
                ),
              ),
            );
          }
          if (snapshot.hasData) {
            final books = snapshot.data;
            if (books != null) {
              return SizedBox(
                height: 192,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: books.length,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: BookWidget(
                      book: books[index],
                    ),
                  ),
                ),
              );
            }
          }
          return SizedBox(
            height: 192,
            child: Shimmer.fromColors(
              baseColor: AppColors.white,
              highlightColor: AppColors.deepOrange.withOpacity(1),
              child: const SizedBox(
                height: 192,
                width: double.infinity,
                child: Card(margin: EdgeInsets.zero),
              ),
            ),
          );
        });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
  // SizedBox(
  //       height: 192,
  //       child: ListView.builder(
  //         scrollDirection: Axis.horizontal,
  //         itemCount: _books.length,
  //         itemBuilder: (context, index) => Padding(
  //           padding: const EdgeInsets.only(right: 8.0),
  //           child: BookWidget(
  //             book: _books[index],
  //           ),
  //         ),
  //       ),
  //     ),

//  : SizedBox(
//             height: 192,
//             child: Shimmer.fromColors(
//               baseColor: AppColors.white,
//               highlightColor: AppColors.deepOrange.withOpacity(1),
//               child: const SizedBox(
//                 height: 192,
//                 width: double.infinity,
//                 child: Card(margin: EdgeInsets.zero),
//               ),
//             ),
//           );