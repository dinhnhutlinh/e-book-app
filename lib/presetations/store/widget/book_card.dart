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
    return Card(
      color: colorScheme.onPrimary,
      clipBehavior: Clip.none,
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
            height: 192 / 1.2,
            width: 128 / 1.2,
            child: CachedNetworkImage(
              imageUrl: book.linkImgOnl ?? '',
            ),
          ),
          Expanded(
            child: SizedBox(
              height: 192 / 1.2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        ListTile(
                          title: Text(
                            book.name ?? '',
                            style: textTheme.headline6,
                          ),
                          subtitle: Text(
                            book.category?.name ?? '',
                          ),
                        ),
                      ],
                    ),
                  ),
                  ButtonBar(
                    // buttonPadding: EdgeInsets.zero,
                    children: [
                      ElevatedButton(
                          onPressed: () {}, child: const Text('Download'))
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
