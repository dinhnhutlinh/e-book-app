// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_book_app/presetations/reading/pages/book_viewer_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:e_book_app/models/book.dart';

class BookProgress extends StatelessWidget {
  // final _progressController = Get.find<ProgressController>();
  final Book book;
  final int pages;
  const BookProgress({
    Key? key,
    required this.book,
    required this.pages,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: CachedNetworkImage(
          imageUrl: book.linkImgOnl ?? '',
          height: 72,
          width: 48,
        ),
      ),
      title: Text(book.name ?? ''),
      trailing: Text('$pages /${book.pages ?? 300}'),
      onTap: () => Get.toNamed(BookViewerPage.route, arguments: book),
    );
  }
}
