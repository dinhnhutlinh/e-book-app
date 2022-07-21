// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_book_app/presetations/book_detail/pages/book_detail_page.dart';
import 'package:e_book_app/presetations/library/controller/download_controller.dart';
import 'package:e_book_app/presetations/reading/pages/book_viewer_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:e_book_app/models/book.dart';
import 'package:e_book_app/presetations/library/controller/fav_controller.dart';

class MoreOptionBook extends StatelessWidget {
  final _favController = Get.find<FavBookController>();
  final _downloadController = Get.find<DownloadController>();
  final Book book;
  MoreOptionBook({
    Key? key,
    required this.book,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      decoration: BoxDecoration(
        color: colorScheme.background,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
      ),
      child: ListView(
        padding: const EdgeInsets.only(top: 12, bottom: 12),
        shrinkWrap: true,
        children: [
          ListTile(
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
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.book_outlined),
            title: const Text('About this book'),
            onTap: () {
              Get.back();
              Get.toNamed(BookDetailPage.route, arguments: book);
            },
          ),
          const Divider(
            height: 0.1,
          ),
          if (_downloadController.checkDownload(bookId: book.id ?? ''))
            Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.book_outlined),
                  title: const Text('Read book'),
                  onTap: () {
                    Get.back();
                    Get.toNamed(BookViewerPage.route, arguments: book);
                  },
                ),
                const Divider(
                  height: 0.1,
                ),
              ],
            ),
          _favController.checkFavBook(book.id ?? '')
              ? ListTile(
                  leading: const Icon(Icons.favorite_border_outlined),
                  title: const Text('Dont\'t like this book'),
                  onTap: () {
                    Get.back();
                    _favController.removeFavBook(book: book);
                  },
                )
              : ListTile(
                  leading: const Icon(Icons.favorite_border_outlined),
                  title: const Text('Like'),
                  onTap: () {
                    Get.back();
                    _favController.addFavBook(book: book);
                  },
                ),
          const Divider(
            height: 0.1,
          ),
          _downloadController.checkDownload(bookId: book.id ?? '')
              ? ListTile(
                  leading: const Icon(Icons.download_done),
                  title: const Text('Remove download'),
                  onTap: () {
                    Get.back();
                    _downloadController.removeDownload(book);
                  },
                )
              : ListTile(
                  leading: const Icon(Icons.download),
                  title: const Text('Download'),
                  onTap: () {
                    Get.back();
                    _downloadController.addDownload(book);
                  },
                ),
          const Divider(
            height: 0.1,
          ),
        ],
      ),
    );
  }
}
