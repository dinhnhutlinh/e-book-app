import 'package:e_book_app/common_widget/stateless/review_list_tile.dart';
import 'package:e_book_app/models/review.dart';
import 'package:e_book_app/presetations/book_detail/controllers/book_detail_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReviewsDialog extends GetView<BookDetailController> {
  const ReviewsDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Rating and reviews'.tr)),
      body: controller.ratings.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.upcoming_outlined,
                    size: 96,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Text(
                    'Empty'.tr,
                    style: Theme.of(context).textTheme.titleLarge,
                  )
                ],
              ),
            )
          : ListView(
              padding: const EdgeInsets.all(12),
              children: [
                for (Review review in controller.ratings)
                  ReviewListTile(review: review),
              ],
            ),
    );
  }
}
