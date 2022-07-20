import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_book_app/models/book.dart';
import 'package:e_book_app/presetations/book_detail/pages/book_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class BookCard extends StatelessWidget {
  Book book;

  BookCard({Key? key, required this.book}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return ListTile(
      onTap: () => Get.toNamed(BookDetailPage.route, arguments: book),
      leading: SizedBox(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: CachedNetworkImage(
            imageUrl: book.linkImgOnl ?? '',
            fit: BoxFit.fill,
            height: 120,
            width: 40,
            placeholder: (context, url) => Shimmer.fromColors(
              baseColor: Colors.grey,
              highlightColor: Colors.grey.withOpacity(0.2),
              child: const SizedBox(
                height: 192,
                width: 128,
                child: Card(margin: EdgeInsets.zero),
              ),
            ),
          ),
        ),
      ),
      title: Text(
        book.name ?? '',
        style: textTheme.titleMedium,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: ListBody(
        children: [
          Text(
            book.category?.name ?? '',
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            '\$ ${book.price}',
            style: textTheme.bodyText1,
          ),
        ],
      ),
    );
  }
}
