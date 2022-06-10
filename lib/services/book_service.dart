import 'dart:convert';

import 'package:e_book_app/models/book.dart';
import 'package:e_book_app/repositories/book_repository.dart';
import 'package:e_book_app/utils/string_util.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class BookService extends GetxService {
  final _bookRepository = BookRepository();

  @override
  Future<void> onInit() async {
    final listBook =
        (jsonDecode(await rootBundle.loadString('assets/book2.json')) as List)
            .map(
              (e) => Book.fromJson(e)
                ..updateAt = DateTime.now()
                ..id = StringUtil.getRandomString(8),
            )
            .toList();

    for (var book in listBook) {
      _bookRepository.createOrUpdateBook(book);
    }
    super.onInit();
  }
}
