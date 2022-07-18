import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_book_app/presetations/store/controllers/book_detail_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookDetailPage extends GetView<BookDetailController> {
  static const route = '/BookDetail';

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        actions: [
          Obx(
            () => IconButton(
              onPressed: () {
                if (controller.wasLike) {
                  controller.likeBook();
                } else {
                  controller.unLikeBook();
                }
              },
              icon: Icon(
                color: colorScheme.primary,
                controller.wasLike
                    ? Icons.favorite
                    : Icons.favorite_border_outlined,
              ),
            ),
          ),
          IconButton(
            icon: const Icon(
              Icons.more_vert,
            ),
            onPressed: () {},
          )
        ],
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 16, left: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CachedNetworkImage(
                  imageUrl: controller.book.linkImgOnl ?? '',
                  height: 200,
                ),
                const SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        controller.book.name ?? '',
                        style: textTheme.headline5,
                        maxLines: null,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        controller.book.author ?? '',
                        style: textTheme.titleSmall,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        controller.book.category?.name ?? '',
                        style: textTheme.bodySmall,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16, left: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(),
                    onPressed: () {},
                    child: const Text('Read sample'),
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      // Foreground color
                      onPrimary: Theme.of(context).colorScheme.primaryContainer,
                      // Background color
                      primary: Theme.of(context).colorScheme.primary,
                    ).copyWith(elevation: ButtonStyleButton.allOrNull(0.0)),
                    onPressed: () {},
                    child: Text('Buy \$${controller.book.price ?? 0}'),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          InkWell(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.only(
                right: 16,
                left: 16,
                top: 8,
                bottom: 8,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'About this book',
                        style: textTheme.titleMedium,
                      ),
                      Icon(
                        Icons.arrow_forward,
                        color: colorScheme.primary,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Text(
                    controller.book.content ?? '',
                    style: textTheme.bodyText2,
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
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
