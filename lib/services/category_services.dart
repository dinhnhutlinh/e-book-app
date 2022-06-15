import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_book_app/configs/defind.dart';
import 'package:e_book_app/models/category.dart';
import 'package:get/get.dart';

class CategoryService extends GetxService {
  final categoryRef = FirebaseFirestore.instance.collection(Defind.category);
  // final _categoriesRepository = CategoryRepository();
  // List<Category> cats = [];

  // Future<List<Category>> getAll() async =>
  //     cats = await _categoriesRepository.getAllCategory();

  // Future<void> updateOrCrateCat(Category category) =>
  //     _categoriesRepository.updateOrCreateCat(category);

  // Future<void> deteleCat(Category category) =>
  //     _categoriesRepository.deleteCat(category);

  // Future<int> countCat() => _categoriesRepository.countBooks();

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
