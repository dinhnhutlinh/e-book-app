import 'dart:convert';

import 'package:e_book_app/data/models/category.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class CategoryDataSource {
  Future<List<Category>> getAllCategory() async {
    List<Category> categories =
        (json.decode(await rootBundle.loadString('assets/category.json'))
                as List)
            .map((data) => Category.fromJson(data))
            .toList();

    return categories;
  }
}
