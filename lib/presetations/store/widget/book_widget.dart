import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_book_app/models/book.dart';
import 'package:e_book_app/presetations/book_detail/pages/book_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class BookWidget extends StatelessWidget {
  final Book book;

  const BookWidget({super.key, required this.book});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 192,
      width: 128,
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: () => Get.toNamed(BookDetailPage.route, arguments: book),
          child: CachedNetworkImage(
            imageUrl: book.linkImgOnl ?? '',
            fit: BoxFit.cover,
            placeholder: (context, url) => Shimmer.fromColors(
              baseColor: Colors.grey,
              highlightColor: Colors.grey.withOpacity(0.2),
              child: const SizedBox(
                height: 192,
                width: 128,
                child: Card(margin: EdgeInsets.zero),
              ),
            ),
            errorWidget: (context, url, error) => const SizedBox(
              height: 192,
              width: 128,
              child: Card(
                margin: EdgeInsets.zero,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
