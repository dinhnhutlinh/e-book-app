import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_book_app/models/book.dart';
import 'package:e_book_app/presetations/library/controller/fav_controller.dart';
import 'package:e_book_app/presetations/library/widget/more_option_book.dart';
import 'package:e_book_app/presetations/reading/pages/book_viewer_page.dart';
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
            for (Book book in controller.farBooks)
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: ListTile(
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: CachedNetworkImage(
                      imageUrl: book.linkImgOnl ?? '',
                      height: 72,
                    ),
                  ),
                  title: Text(book.name ?? ''),
                  subtitle: ListBody(children: [
                    Text(book.category?.name ?? ''),
                    Text(book.author ?? '')
                  ]),
                  trailing: IconButton(
                    icon: const Icon(Icons.more_vert),
                    onPressed: () => showMoreSelect(book: book),
                  ),
                  onLongPress: () => showMoreSelect(book: book),
                  onTap: () =>
                      Get.toNamed(BookViewerPage.route, arguments: book),
                ),
              ),
          ],
        ),
      ),
    );
  }

  void showMoreSelect({required Book book}) {
    Get.bottomSheet(MoreOptionBook(book: book));
  }
}
