import 'package:e_book_app/common_widget/stateless/book_card.dart';
import 'package:e_book_app/models/book.dart';
import 'package:e_book_app/presetations/library/controller/fav_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class FavoriteBookList extends GetView<FavBookController> {
  const FavoriteBookList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return controller.obx(
      onLoading: const Center(
        child: CircularProgressIndicator(),
      ),
      (state) => Obx(() => ListView(
            padding: const EdgeInsets.all(12),
            children: [
              for (Book book in controller.farBooks) BookCard(book: book),
            ],
          )),
    );
  }
}
