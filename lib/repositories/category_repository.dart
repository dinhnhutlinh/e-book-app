import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_book_app/configs/defind.dart';
import 'package:e_book_app/models/category.dart';
import 'package:e_book_app/utils/exception.dart';

class CategoryRepository {
  final CollectionReference _categorys =
      FirebaseFirestore.instance.collection(Defind.category);
  Future<List<Category>> getAllCategory() async {
    final data = await _categorys.get().onError(
          (error, stackTrace) => throw DataException(
            'Không lấy được dữ liệu',
          ),
        );
    return data.docs
        .map((e) => Category.fromJson(e.data() as Map<String, dynamic>))
        .toList();
  }

  Future<void> updateOrCreateCat(Category category) async => await _categorys
      .doc('${category.id}')
      .set(category.toJson())
      .onError((error, stackTrace) =>
          throw DataException('Cập nhật không thành công'));

  Future<void> deleteCat(Category category) async => await _categorys
      .doc("${category.id}")
      .delete()
      .onError((error, stackTrace) =>
          throw DataException('Cập nhật không thành công'));
}
