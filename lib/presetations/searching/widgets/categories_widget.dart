import 'package:dynamic_color/dynamic_color.dart';
import 'package:e_book_app/presetations/searching/controller/searching_controller.dart';
import 'package:e_book_app/presetations/searching/pages/category_book_page.dart';
import 'package:e_book_app/utils/custom_color.g.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoriesWidget extends GetView<SearchingController> {
  final colors = [Colors.red, Colors.green, Colors.orange];

  Color ramdonColor(int index, ColorScheme colorScheme) {
    return colors[index % colors.length].harmonizeWith(colorScheme.primary);
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final customColor = Theme.of(context).extension<CustomColors>();
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
          style: OutlinedButton.styleFrom(
            backgroundColor: Theme.of(context)
                .extension<CustomColors>()!
                .customcolor1Container,
            primary: Theme.of(context).extension<CustomColors>()?.customcolor1,
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
