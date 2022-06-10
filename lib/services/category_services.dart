import 'package:e_book_app/models/category.dart';
import 'package:e_book_app/repositories/category_repository.dart';
import 'package:get/get.dart';

class CategoryService extends GetxService {
  final _categoriesRepository = CategoryRepository();

  Future<List<Category>> getAll() => _categoriesRepository.getAllCategory();

  Future<void> updateOrCrateCat(Category category) =>
      _categoriesRepository.updateOrCreateCat(category);

  Future<void> deteleCat(Category category) =>
      _categoriesRepository.deleteCat(category);
}
