import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_book_app/models/book.dart';
import 'package:flutter/material.dart';

class BookCard extends StatelessWidget {
  Book book;
  BookCard({Key? key, required this.book}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return SizedBox(
      height: 182,
      child: Card(
        color: colorScheme.onPrimary,
        clipBehavior: Clip.antiAlias,
        elevation: 0,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: Theme.of(context).colorScheme.outline,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(12)),
        ),
        child: Row(
          children: [
            SizedBox(
              child: CachedNetworkImage(
                imageUrl: book.linkImgOnl ?? '',
                fit: BoxFit.fill,
              ),
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
                    const Divider(
                      height: 0.1,
                    ),
                    ButtonBar(
                      children: [
                        ElevatedButton(
                          onPressed: () {},
                          child: const Text(
                            'Download',
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
