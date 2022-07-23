import 'package:e_book_app/presetations/admin/categorys/controller/categories_controller.dart';
import 'package:e_book_app/presetations/searching/pages/category_book_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoriesWidget extends GetView<CategoriesController> {
  const CategoriesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 12, bottom: 12),
            child: Text(
              'category'.tr,
              style: textTheme.titleMedium,
            ),
          ),
        ),
        SizedBox(
          height: 42,
          child: Obx(
            () => ListView.builder(
              padding: const EdgeInsets.only(
                left: 12,
              ),
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: controller.categories.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Theme.of(context).colorScheme.primaryContainer,
                    elevation: 0,
                    onPrimary: Theme.of(context).colorScheme.onPrimaryContainer,
                  ).copyWith(elevation: ButtonStyleButton.allOrNull(0.0)),
                  onPressed: () => Get.toNamed(CategoryBookPage.route,
                      arguments: controller.categories[index]),
                  child: Text(
                    controller.categories[index].name ?? '',
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
