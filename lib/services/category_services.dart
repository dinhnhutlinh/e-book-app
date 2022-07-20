import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_book_app/configs/defind.dart';
import 'package:e_book_app/models/category.dart';
import 'package:get/get.dart';

class CategoryService extends GetxService {
  final categoryRef = FirebaseFirestore.instance.collection(Define.category);

  Future<List<Category>> getAll() async => (await categoryRef.get())
      .docs
      .map((e) => Category.fromJson(e.data()))
      .toList();

  Future<void> addCat(Category category) async =>
      categoryRef.doc(category.id).set(category.toJson());

  Future<void> deleteCat(Category category) async =>
      await categoryRef.doc(category.id).delete();

  Future<int> countCat() async => (await categoryRef.get()).docs.length;
}
