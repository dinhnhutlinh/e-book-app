import 'package:e_book_app/models/book.dart';
import 'package:e_book_app/models/review.dart';
import 'package:e_book_app/models/user_profile.dart';
import 'package:e_book_app/presetations/user/controllers/user_controller.dart';
import 'package:e_book_app/services/auth_service.dart';
import 'package:e_book_app/services/book_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

class BookDetailController extends GetxController {
  final _bookServices = Get.find<BookService>();
  final _authServices = Get.find<AuthService>();

  Book book = Get.arguments;
  RxBool wasLoad = false.obs;
  final RxList<Review> _ratings = <Review>[].obs;
  final RxBool _wasLike = false.obs;
  final Rxn<Review> _ownReview = Rxn<Review>();
  @override
  Future<void> onInit() async {
    _wasLike.value = await _bookServices.wasLike(
        bookId: book.id ?? '', userId: _authServices.user?.uid ?? '');
    _loadingRating();
    _loadOwnReview();
    super.onInit();
  }

  Future<void> likeBook() async {
    await _bookServices
        .likeBook(bookId: book.id ?? '', userId: _authServices.user?.uid ?? '')
        .then((value) {
      _wasLike.value = true;
    });
  }

  Future<void> unLikeBook() async {
    await _bookServices
        .unlikeBook(
            bookId: book.id ?? '', userId: _authServices.user?.uid ?? '')
        .then((value) {
      _wasLike.value = false;
    });
  }

  void showContent() {
    Get.dialog(
      Scaffold(
        appBar: AppBar(
          title: const Text('About this book'),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.only(
            top: 12,
            left: 12,
            right: 12,
            bottom: 12,
          ),
          child: Text(
            book.content ?? '',
          ),
        ),
      ),
      useSafeArea: true,
    );
  }

  void showReview() {
    String content = ownReview?.content ?? '';
    double rate = ownReview == null ? 0.0 : ownReview!.rate!.toDouble();
    Get.dialog(
      Scaffold(
        appBar: AppBar(
          actions: [
            TextButton(
              onPressed: () {
                addReview(
                  review: Review(
                    rate: rate.toInt(),
                    content: content,
                    update: DateTime.now(),
                  ),
                );
              },
              child: const Text('Submit'),
            ),
          ],
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.only(
            top: 12,
            left: 12,
            right: 12,
            bottom: 12,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Your Review',
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
                itemBuilder: (context, _) => const Icon(
                  Icons.favorite,
                ),
                onRatingUpdate: (rating) {
                  rate = rating;
                },
              ),
              const SizedBox(
                height: 16,
              ),
              TextField(
                onChanged: (value) => content = value,
                maxLength: 1000,
                maxLines: null,
                decoration: const InputDecoration(
                  labelText: 'Review',
                  border: OutlineInputBorder(),
                ),
              ),
            ],
          ),
        ),
      ),
      useSafeArea: true,
    );
  }

  Future<void> _loadingRating() async {
    await _bookServices
        .getAllReview(book.id ?? '')
        .then((value) => _ratings.addAll(value));
  }

  Future<void> _loadOwnReview() async {
    UserProfile user = Get.find<UserController>().profile!;
    _bookServices
        .getOwnReview(user.id ?? '')
        .then((value) => _ownReview.value = value);
  }

  Future<void> addReview({required Review review}) async {
    UserProfile user = Get.find<UserController>().profile!;
    review.user = user;
    _ownReview.value = review;
    _bookServices.addReview(review: review, book: book, userId: user.id ?? '');
  }

  Review? get ownReview => _ownReview.value;
  List<Review> get ratings => _ratings;
  bool get wasLike => _wasLike.value;
}
