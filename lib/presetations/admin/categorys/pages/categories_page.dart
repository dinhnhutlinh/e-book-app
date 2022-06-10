import 'package:e_book_app/models/category.dart';
import 'package:e_book_app/presetations/admin/categorys/controller/categories_controller.dart';
import 'package:e_book_app/presetations/admin/categorys/pages/category_detail_page.dart';
import 'package:e_book_app/presetations/admin/dashbroad/widgets/manager_tile.dart';
import 'package:e_book_app/themes/app_colors.dart';
import 'package:e_book_app/themes/app_text_style.dart';
import 'package:e_book_app/utils/string_util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoriesPage extends StatelessWidget {
  static const name = '/Categories';

  CategoriesPage({Key? key}) : super(key: key);

  final _categoriesController = Get.put(CategoriesController());

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height,
      width: Get.width,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            AppColors.darkBlue,
            AppColors.lightBlue,
          ],
          stops: [0.0, 1.0],
          tileMode: TileMode.clamp,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          iconTheme: const IconThemeData(
            color: AppColors.white,
          ),
          title: Text(
            'Danh mục',
            style: AppTextStyle.headerWhite,
          ),
        ),
        floatingActionButton: Obx(
          () => Visibility(
            visible: _categoriesController.isVisibleFloatButton,
            child: FloatingActionButton(
              backgroundColor: AppColors.deepOrange,
              onPressed: () => Get.toNamed(
                CategoryDetailPage.route,
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
            color: AppColors.blueBackground,
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
                          onPressed: () => _categoriesController.deleteCat(
                              _categoriesController.categories[index]),
                          icon: const Icon(Icons.delete),
                        ),
                        onPress: () => Get.toNamed(
                          CategoryDetailPage.route,
                          arguments: _categoriesController.categories[index],
                        ),
                      ),
                    ),
                  )
                : const Center(
                    child: CircularProgressIndicator(
                      color: AppColors.deepOrange,
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
