import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_book_app/configs/defind.dart';
import 'package:e_book_app/models/book.dart';
import 'package:e_book_app/models/review.dart';
import 'package:e_book_app/presetations/user/controllers/user_controller.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';

class BookService extends GetxService {
  final bookRef = FirebaseFirestore.instance.collection(Define.book);
  final reviewRef = FirebaseFirestore.instance.collection(Define.review);
  final bookImageRef = FirebaseStorage.instance.ref().child('images');
  final bookPdfRef = FirebaseStorage.instance.ref().child('pdf');

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
          'name',
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
    return await bookRef.limit(padding).get().then((snapshot) =>
        snapshot.docs.map((e) => Book.fromJson(e.data())).toList());
  }

  Future<List<Review>> getAllReview({required String bookId}) async {
    final collection = bookRef.doc(bookId).collection('review');
    final data = await collection
        .where('userId',
            isNotEqualTo: Get.find<UserController>().profile?.id ?? '')
        // .orderBy('update', descending: true)
        .get();

    if (data.docs.isNotEmpty) {
      return data.docs.map((e) => Review.fromJson(e.data())).toList();
    }
    return [];
  }

  Future<Review?> getOwnReview(
      {required String bookId, required String uid}) async {
    return bookRef
        .doc(bookId)
        .collection('review')
        .where('userId', isEqualTo: uid)
        .get()
        .then((value) {
      if (value.docs.isEmpty) {
        return null;
      } else {
        return Review.fromJson(value.docs.first.data());
      }
    });
  }

  Future<void> addReview(
      {required String bookId,
      required Review review,
      required String userId}) async {
    await bookRef
        .doc(bookId)
        .collection('review')
        .doc(userId)
        .set(review.toJson());
  }

  void deleteOwnReview({required String bookId, required String userId}) {
    bookRef.doc(bookId).collection('review').doc(userId).delete();
  }

  Future<List<Book>> bookOfCategory({String? categoyId}) async {
    return (bookRef.where('category.id', isEqualTo: categoyId)).get().then(
        (value) => value.docs.map((e) => Book.fromJson(e.data())).toList());
  }

  Future<List<Book>> favoriteBook({required String uid}) async {
    return (await bookRef.where('likes', arrayContains: uid).get())
        .docs
        .map((e) => Book.fromJson(e.data()))
        .toList();
  }

  Future<List<Book>> getBookWithIdInList({required List<String> ids}) async {
    if (ids.isEmpty) {
      return [];
    }
    return (await bookRef.where('id', whereIn: ids).get())
        .docs
        .map((e) => Book.fromJson(e.data()))
        .toList();
  }

  Future<List<Book>> getTrendBook() async {
    return (await bookRef.limit(10).where('update').get())
        .docs
        .map((e) => Book.fromJson(e.data()))
        .toList();
  }

  Future<String> uploadImage(
      {required File image, required String bookId}) async {
    final task = bookImageRef.child(bookId).putFile(image);
    final snap = await task.whenComplete(() {});
    return snap.ref.getDownloadURL();
  }

  Future<String> uploadPdf({required File pdf, required String bookId}) async {
    final task = bookPdfRef.child(bookId).putFile(pdf);
    final snap = await task.whenComplete(() {});
    return snap.ref.getDownloadURL();
  }
}
