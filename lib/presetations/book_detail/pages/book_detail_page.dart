import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_book_app/presetations/book_detail/controllers/book_detail_controller.dart';
import 'package:e_book_app/presetations/book_detail/widget/book_reviews.dart';
import 'package:e_book_app/presetations/book_detail/widget/write_review.dart';
import 'package:e_book_app/presetations/reading/pages/book_viewer_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookDetailPage extends GetView<BookDetailController> {
  static const route = '/BookDetail';

  const BookDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: colorScheme.secondaryContainer,
            actions: [
              Obx(
                () => IconButton(
                  onPressed: controller.wasLike
                      ? controller.unLikeBook
                      : controller.likeBook,
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
          SliverList(
              delegate: SliverChildListDelegate([
            Container(
              decoration: BoxDecoration(
                color: colorScheme.secondaryContainer,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(12),
                  bottomRight: Radius.circular(12),
                ),
              ),
              child: Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(right: 16, left: 16, top: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: CachedNetworkImage(
                            imageUrl: controller.book.linkImgOnl ?? '',
                            height: 200,
                          ),
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
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Obx(
                    () => SizedBox(
                      width: Get.width,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 16, left: 16),
                        child: controller.wasDownload
                            ? Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        onPrimary: Theme.of(context)
                                            .colorScheme
                                            .onError,
                                        primary:
                                            Theme.of(context).colorScheme.error,
                                      ).copyWith(
                                          elevation:
                                              ButtonStyleButton.allOrNull(0.0)),
                                      onPressed: controller.deleteDownload,
                                      child: Text('Delete'.tr),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 16,
                                  ),
                                  Expanded(
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        onPrimary: Theme.of(context)
                                            .colorScheme
                                            .onPrimary,
                                        primary: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                      ).copyWith(
                                          elevation:
                                              ButtonStyleButton.allOrNull(0.0)),
                                      onPressed: () {
                                        Get.toNamed(
                                          BookViewerPage.route,
                                          arguments: controller.book,
                                        );
                                      },
                                      child: Text('Read'.tr),
                                    ),
                                  ),
                                ],
                              )
                            : ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  // Foreground color
                                  onPrimary: Theme.of(context)
                                      .colorScheme
                                      .primaryContainer,
                                  // Background color
                                  primary:
                                      Theme.of(context).colorScheme.primary,
                                ).copyWith(
                                    elevation:
                                        ButtonStyleButton.allOrNull(0.0)),
                                onPressed: controller.downloadBook,
                                child: Text('Download'.tr),
                              ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: controller.showContent,
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
                          'About this book'.tr,
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
            ),
            const BookReview(),
            const WriteReview(),
          ])),
        ],
      ),
    );
  }
}
