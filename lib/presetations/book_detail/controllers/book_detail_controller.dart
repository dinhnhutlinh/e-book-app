import 'package:e_book_app/models/book.dart';
import 'package:e_book_app/models/review.dart';
import 'package:e_book_app/models/user_profile.dart';
import 'package:e_book_app/presetations/book_detail/widget/about_this_book.dart';
import 'package:e_book_app/presetations/book_detail/widget/review_dialog.dart';
import 'package:e_book_app/presetations/book_detail/widget/reviews_dialog.dart';
import 'package:e_book_app/presetations/library/controller/download_controller.dart';
import 'package:e_book_app/presetations/library/controller/fav_controller.dart';
import 'package:e_book_app/presetations/user/controllers/user_controller.dart';
import 'package:e_book_app/services/book_service.dart';
import 'package:get/get.dart';

class BookDetailController extends GetxController {
  final _bookServices = Get.find<BookService>();
  final _favBookController = Get.find<FavBookController>();
  final _downloadController = Get.find<DownloadController>();

  Book book = Get.arguments;
  RxBool wasLoad = false.obs;

  final RxBool _wasDownload = false.obs;
  final RxList<Review> _ratings = <Review>[].obs;
  final RxBool _wasLike = false.obs;
  final Rxn<Review> _ownReview = Rxn<Review>();

  deleteDownload() {
    _downloadController.removeDownload(book);
    _wasDownload.value = false;
  }

  @override
  Future<void> onInit() async {
    _wasLike.value = _favBookController.checkFavBook(book.id ?? '');
    _wasDownload.value =
        _downloadController.checkDownload(bookId: book.id ?? '');
    _loadingReview();
    _loadOwnReview();
    super.onInit();
  }

  Future<void> likeBook() async {
    _favBookController.addFavBook(book: book);
    _wasLike.value = true;
  }

  Future<void> unLikeBook() async {
    _favBookController.removeFavBook(book: book);
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
    _bookServices
        .getOwnReview(
            uid: Get.find<UserController>().uid, bookId: book.id ?? '')
        .then((value) => _ownReview.value = value);
  }

  void deleteOwnReview() {
    _ownReview.value = null;
    _bookServices.deleteOwnReview(
        bookId: book.id ?? '', userId: Get.find<UserController>().uid);
  }

  void downloadBook() {
    _downloadController.addDownload(book);
    _wasDownload.value = true;
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
  bool get wasDownload => _wasDownload.value;
}
