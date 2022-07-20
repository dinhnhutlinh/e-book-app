// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:e_book_app/models/review.dart';
import 'package:e_book_app/presetations/book_detail/controllers/book_detail_controller.dart';
import 'package:e_book_app/common_widget/stateless/review_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class BookReview extends GetView<BookDetailController> {
  const BookReview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return InkWell(
      onTap: controller.showReviews,
      child: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.only(right: 16, left: 16, top: 8, bottom: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Ratings and reviews',
                  style: textTheme.titleMedium,
                ),
                Icon(
                  Icons.arrow_forward,
                  color: colorScheme.primary,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Obx(
            () => controller.ratings.isEmpty
                ? const Center(
                    child: Text('No review'),
                  )
                : Column(
                    children: [
                      for (Review review in controller.ratings.sublist(
                          0,
                          controller.ratings.length > 3
                              ? 3
                              : controller.ratings.length))
                        ReviewListTile(review: review),
                    ],
                  ),
          )
        ],
      ),
    );
  }
}
