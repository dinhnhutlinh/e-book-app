import 'package:e_book_app/models/category.dart';
import 'package:e_book_app/presetations/admin/categorys/controller/categories_controller.dart';
import 'package:e_book_app/presetations/admin/categorys/pages/category_detail_page.dart';
import 'package:e_book_app/presetations/admin/dashboard/widgets/manager_tile.dart';
import 'package:e_book_app/utils/string_util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoriesPage extends StatelessWidget {
  static const name = '/Categories';

  CategoriesPage({Key? key}) : super(key: key);

  final _categoriesController = Get.put(CategoriesController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(),
        title: const Text(
          'Danh mục',
        ),
      ),
      floatingActionButton: Obx(
        () => Visibility(
          visible: _categoriesController.isVisibleFloatButton,
          child: FloatingActionButton(
            onPressed: () => Get.toNamed(
              CategoryEditPage.route,
              arguments: Category(
                id: StringUtil.getRandomString(8),
              ),
            ),
            child: const Icon(
              Icons.add,
            ),
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(
              16,
            ),
            topRight: Radius.circular(
              16,
            ),
          ),
        ),
        child: Obx(
          () => _categoriesController.wasLoad
              ? RefreshIndicator(
                  onRefresh: _categoriesController.fetchData,
                  child: ListView.builder(
                    controller: _categoriesController.scollController,
                    padding: const EdgeInsets.all(16),
                    itemCount: _categoriesController.categories.length,
                    itemBuilder: (context, index) => ManagerTile(
                      title: Text(
                          _categoriesController.categories[index].name ?? ''),
                      subTitle: Text(
                          'ID: ${_categoriesController.categories[index].id} '),
                      trailing: IconButton(
                        onPressed: () => _categoriesController
                            .deleteCat(_categoriesController.categories[index]),
                        icon: const Icon(Icons.delete),
                      ),
                      onPress: () => Get.toNamed(
                        CategoryEditPage.route,
                        arguments: _categoriesController.categories[index],
                      ),
                    ),
                  ),
                )
              : const Center(
                  child: CircularProgressIndicator(),
                ),
        ),
      ),
    );
  }
}
