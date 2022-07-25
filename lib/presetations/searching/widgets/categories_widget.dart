import 'package:dynamic_color/dynamic_color.dart';
import 'package:e_book_app/presetations/admin/categorys/controller/categories_controller.dart';
import 'package:e_book_app/presetations/searching/pages/category_book_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoriesWidget extends GetView<CategoriesController> {
  final colors = [Colors.red, Colors.green, Colors.orange];

  CategoriesWidget({Key? key}) : super(key: key);

  Color ramdonColor(int index, ColorScheme colorScheme) {
    return colors[index % colors.length].harmonizeWith(colorScheme.primary);
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 2,
          childAspectRatio: 1.68,
        ),
        primary: false,
        padding: const EdgeInsets.all(16),
        itemCount: controller.categories.length,
        itemBuilder: (context, index) => ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Theme.of(context).colorScheme.secondary,
            onPrimary: Theme.of(context).colorScheme.onSecondary,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
          onPressed: () => Get.toNamed(CategoryBookPage.route,
              arguments: controller.categories[index]),
          child: Text(
            controller.categories[index].name ?? '',
          ),
        ),
      ),
    );
  }
}
