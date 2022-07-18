import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_book_app/configs/defind.dart';
import 'package:e_book_app/models/book.dart';
import 'package:e_book_app/models/review.dart';
import 'package:get/get.dart';

class BookService extends GetxService {
  final bookRef = FirebaseFirestore.instance.collection(Define.book);

  Future<List<Book>> getAllBook() async =>
      (await bookRef.get()).docs.map((e) => Book.fromJson(e.data())).toList();

  Future<int> countBook() async => (await bookRef.get()).docs.length;

  Future<void> addBood(Book book) async =>
      await bookRef.doc(book.id).set(book.toJson());

  Future<void> deleteBook(Book book) async =>
      await bookRef.doc(book.id).delete();

  Future<List<Book>> loadLastBook(
          {required int paging,
          required int limit,
          required int currnerIndex}) async =>
      (await bookRef.orderBy('updateAt', descending: true).limit(20).get())
          .docs
          .map((e) => Book.fromJson(e.data()))
          .toList();

  Future<List<Book>> loadBookByCat(
          {required String categoryId,
          required int paging,
          required int limit,
          required int currnerIndex}) async =>
      (await bookRef
              .where('category.id', isEqualTo: categoryId)
              .orderBy('updateAt', descending: true)
              .limit(limit)
              .get())
          .docs
          .map((e) => Book.fromJson(e.data()))
          .toList();

  Future<void> updataBook({required Book book}) async {
    await bookRef.doc(book.id).set(book.toJson());
  }

  Future<bool> wasLike({required String bookId, required String userId}) async {
    return (await bookRef
            .where('id', isEqualTo: bookId)
            .where('likes', arrayContains: userId)
            .get())
        .docs
        .isNotEmpty;
  }

  Future<void> likeBook(
      {required String bookId, required String userId}) async {
    await bookRef.doc(bookId).update({
      'likes': FieldValue.arrayUnion([userId]),
    });
  }

  Future<void> unlikeBook(
      {required String bookId, required String userId}) async {
    await bookRef.doc(bookId).update({
      'likes': FieldValue.arrayRemove([userId]),
    });
  }

  Future<List<Book>> searchWithQuery({required String query}) async {
    return await bookRef
        .where(
          ['name', 'content'],
          isGreaterThanOrEqualTo: query,
        )
        .get()
        .then(
          (snapshot) =>
              snapshot.docs.map((e) => Book.fromJson(e.data())).toList(),
        );
  }

  Future<List<Book>> getBooks(
      {required int index, required int padding}) async {
    return await bookRef
        .orderBy(
          'updateAt',
          descending: true,
        )
        .limit(padding)
        .get()
        .then((snapshot) =>
            snapshot.docs.map((e) => Book.fromJson(e.data())).toList());
  }

  Future<List<Review>> getAllReview(String bookId) async {
    return await bookRef
        .doc('bookId')
        .collection('reviews')
        .orderBy('update')
        .get()
        .then((value) =>
            value.docs.map((e) => Review.fromJson(e.data())).toList());
  }

  Future<Review?> getOwnReview(String uid) async {
    return await bookRef
        .doc('bookId')
        .collection('reviews')
        .where('user.uid', isEqualTo: uid)
        .get()
        .then((value) {
      if (value.docs.isEmpty) {
        return null;
      }
      return Review.fromJson(value.docs.first.data());
    });
  }

  Future<void> addReview(
      {required Book book,
      required Review review,
      required String userId}) async {
    await bookRef
        .doc(book.id)
        .collection('review')
        .doc(userId)
        .set(review.toJson());
  }
}
