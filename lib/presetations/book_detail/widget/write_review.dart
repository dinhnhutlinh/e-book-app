import 'package:e_book_app/presetations/book_detail/controllers/book_detail_controller.dart';
import 'package:e_book_app/utils/custom_color.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

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
                  'Your review',
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
                      RatingBar.builder(
                        initialRating: controller.ownReview!.rate!.toDouble(),
                        minRating: 1,
                        direction: Axis.horizontal,
                        itemCount: 5,
                        itemSize: 24,
                        itemPadding:
                            const EdgeInsets.symmetric(horizontal: 4.0),
                        itemBuilder: (context, _) => const Icon(Icons.favorite,
                            size: 16, color: customcolor1),
                        onRatingUpdate: (rating) {},
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        controller.ownReview?.content ?? '',
                        style: textTheme.bodyText2,
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      ButtonBar(
                        children: [
                          OutlinedButton(
                            onPressed: controller.deleteOwnReview,
                            child: Text(
                              'Delete',
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
                            child: const Text(
                              'Edit Review',
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                : Center(
                    child: OutlinedButton(
                      onPressed: controller.showReview,
                      child: const Text(
                        'Write your review',
                      ),
                    ),
                  ),
          )
        ],
      ),
    );
  }
}
