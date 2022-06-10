import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_book_app/configs/defind.dart';
import 'package:e_book_app/models/book.dart';

class BookRepository {
  final CollectionReference _reference =
      FirebaseFirestore.instance.collection(Defind.book);

  Future<void> createOrUpdateBook(Book book) async {
    await _reference.doc(book.id).set(book.toJson());
  }

  Future<List<Book>> getAllBook() async {
    final data = await _reference.get();
    return data.docs
        .map((e) => Book.fromJson(e.data() as Map<String, dynamic>))
        .toList();
  }
}
