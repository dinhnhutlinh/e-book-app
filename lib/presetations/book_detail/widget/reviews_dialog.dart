import 'package:e_book_app/common_widget/stateless/review_list_tile.dart';
import 'package:e_book_app/models/review.dart';
import 'package:e_book_app/presetations/book_detail/controllers/book_detail_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class ReviewsDialog extends GetView<BookDetailController> {
  const ReviewsDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Rating and reviews')),
      body: controller.ratings.isEmpty
          ? const Center(
              child: Text('Don\'t have reviews'),
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
