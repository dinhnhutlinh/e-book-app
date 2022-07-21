import 'package:e_book_app/models/book.dart';
import 'package:e_book_app/presetations/library/controller/fav_controller.dart';
import 'package:e_book_app/presetations/library/widget/book_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoriteBookList extends GetView<FavBookController> {
  const FavoriteBookList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return controller.obx(
      onLoading: const Center(
        child: CircularProgressIndicator(),
      ),
      (state) => Obx(
        () => ListView(
          padding: const EdgeInsets.only(top: 12),
          children: [
            for (Book book in controller.farBooks) BookTile(book: book),
          ],
        ),
      ),
    );
  }
}
