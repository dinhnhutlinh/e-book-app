import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_book_app/models/book.dart';
import 'package:e_book_app/presetations/book_detail/presentations/pages/book_detail_page.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookCard extends StatelessWidget {
  Book book;

  BookCard({Key? key, required this.book}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return InkWell(
      onTap: () => Get.toNamed(BookDetailPage.route, arguments: book),
      child: SizedBox(
        height: 120,
        child: Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Colors.grey.withOpacity(0.2),
              ),
            ),
          ),
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              SizedBox(
                child: CachedNetworkImage(
                  imageUrl: book.linkImgOnl ?? '',
                  fit: BoxFit.fill,
                  height: 120,
                ),
              ),
              const SizedBox(
                width: 12,
              ),
              Expanded(
                child: SizedBox(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            ListTile(
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
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
