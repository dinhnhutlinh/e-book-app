// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_book_app/common_widget/stateless/more_option_book.dart';
import 'package:e_book_app/presetations/book_detail/pages/book_detail_page.dart';
import 'package:flutter/material.dart';

import 'package:e_book_app/models/book.dart';
import 'package:get/get.dart';

class BookTile extends StatelessWidget {
  final Book book;
  const BookTile({
    Key? key,
    required this.book,
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
      subtitle: ListBody(
          children: [Text(book.category?.name ?? ''), Text(book.author ?? '')]),
      trailing: IconButton(
        icon: const Icon(Icons.more_vert),
        onPressed: () => showMoreSelect(book: book),
      ),
      onLongPress: () => showMoreSelect(book: book),
      onTap: () => Get.toNamed(BookDetailPage.route, arguments: book),
    );
  }

  void showMoreSelect({required Book book}) {
    Get.bottomSheet(MoreOptionBook(book: book));
  }
}
