import 'package:e_book_app/models/book.dart';
import 'package:e_book_app/models/review.dart';
import 'package:e_book_app/models/user_profile.dart';
import 'package:e_book_app/presetations/book_detail/widget/about_this_book.dart';
import 'package:e_book_app/presetations/book_detail/widget/review_dialog.dart';
import 'package:e_book_app/presetations/book_detail/widget/reviews_dialog.dart';
import 'package:e_book_app/presetations/user/controllers/user_controller.dart';
import 'package:e_book_app/services/auth_service.dart';
import 'package:e_book_app/services/book_service.dart';
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
    _loadingReview();
    _loadOwnReview();
    super.onInit();
  }

  Future<void> likeBook() async {
    _bookServices.likeBook(
        bookId: book.id ?? '', userId: _authServices.user?.uid ?? '');
    _wasLike.value = true;
  }

  Future<void> unLikeBook() async {
    _bookServices.unlikeBook(
        bookId: book.id ?? '', userId: _authServices.user?.uid ?? '');
    _wasLike.value = false;
  }

  void showContent() {
    Get.dialog(const AboutThisBook(), useSafeArea: true);
  }

  void showReview() {
    Get.dialog(const ReviewDialog(), useSafeArea: true);
  }

  void showReviews() {
    Get.dialog(ReviewsDialog(), useSafeArea: true);
  }

  Future<void> _loadingReview() async {
    await _bookServices
        .getAllReview(bookId: book.id ?? '')
        .then((value) => _ratings.addAll(value));
  }

  Future<void> _loadOwnReview() async {
    UserProfile user = Get.find<UserController>().profile!;
    _bookServices
        .getOwnReview(uid: user.id ?? '', bookId: book.id ?? '')
        .then((value) => _ownReview.value = value);
  }

  void deleteOwnReview() {
    _ownReview.value = null;
    _bookServices.deleteOwnReview(
        bookId: book.id ?? '',
        userId: Get.find<UserController>().profile?.id ?? '');
  }

  Future<void> addReview({required Review review}) async {
    UserProfile user = Get.find<UserController>().profile!;
    review.userId = user.id;
    review.userImage = user.avatar;
    review.userName = user.name;
    _ownReview.value = review;
    _bookServices.addReview(
        review: review, bookId: book.id ?? '', userId: user.id ?? '');
  }

  Review? get ownReview => _ownReview.value;
  List<Review> get ratings => _ratings;
  bool get wasLike => _wasLike.value;
}
