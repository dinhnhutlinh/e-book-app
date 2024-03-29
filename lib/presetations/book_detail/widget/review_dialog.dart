import 'package:e_book_app/models/review.dart';
import 'package:e_book_app/presetations/book_detail/controllers/book_detail_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class ReviewDialog extends GetView<BookDetailController> {
  const ReviewDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final content =
        TextEditingController(text: controller.ownReview?.content ?? '');
    double rate = controller.ownReview == null
        ? 0.0
        : controller.ownReview!.rate!.toDouble();
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: () {
              controller.addReview(
                  review: Review(
                      rate: rate.toInt(),
                      content: content.text,
                      update: DateTime.now()));
              Fluttertoast.showToast(msg: 'Success'.tr);
              Get.back();
            },
            child: Text('Submit'.tr),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding:
            const EdgeInsets.only(top: 12, left: 12, right: 12, bottom: 12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Your Review'.tr,
            ),
            const SizedBox(
              height: 12,
            ),
            RatingBar.builder(
              initialRating: rate,
              minRating: 1,
              direction: Axis.horizontal,
              // allowHalfRating: true,
              itemCount: 5,
              itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
              itemBuilder: (context, _) => Icon(
                Icons.favorite,
                color: colorScheme.primary,
              ),
              onRatingUpdate: (rating) {
                rate = rating;
              },
            ),
            const SizedBox(
              height: 16,
            ),
            TextField(
              controller: content,
              maxLength: 1000,
              maxLines: null,
              decoration: InputDecoration(
                labelText: 'Review'.tr,
                border: const OutlineInputBorder(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
