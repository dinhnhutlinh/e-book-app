import 'package:e_book_app/data/datasources/category_datasource.dart';
import 'package:e_book_app/data/models/category.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class CategoryRepository {
  final CategoryDataSource _categoryDataSource;

  CategoryRepository(this._categoryDataSource);

  Future<List<Category>> allCategory() {
    return _categoryDataSource.getAllCategory();
  }
}
