import 'package:e_book_app/common_widget/stateless/review_list_tile.dart';
import 'package:e_book_app/presetations/book_detail/controllers/book_detail_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WriteReview extends GetView<BookDetailController> {
  const WriteReview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return InkWell(
      onTap: controller.showReview,
      child: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.only(right: 16, left: 16, top: 8, bottom: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Your Review'.tr,
                  style: textTheme.titleMedium,
                ),
                Icon(
                  Icons.arrow_forward,
                  color: colorScheme.primary,
                )
              ],
            ),
          ),
          Obx(
            () => controller.ownReview != null
                ? Column(
                    children: [
                      ReviewListTile(review: controller.ownReview!),
                      ButtonBar(
                        children: [
                          OutlinedButton(
                            onPressed: controller.deleteOwnReview,
                            child: Text(
                              'Delete'.tr,
                              style: textTheme.button!
                                  .copyWith(color: colorScheme.error),
                            ),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              // Foreground color
                              onPrimary: Theme.of(context)
                                  .colorScheme
                                  .primaryContainer,
                              // Background color
                              primary: Theme.of(context).colorScheme.primary,
                            ).copyWith(
                                elevation: ButtonStyleButton.allOrNull(0.0)),
                            onPressed: controller.showReview,
                            child: Text(
                              'Edit'.tr,
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                : Center(
                    child: OutlinedButton(
                      onPressed: controller.showReview,
                      child: Text(
                        'Write your review'.tr,
                      ),
                    ),
                  ),
          )
        ],
      ),
    );
  }
}
