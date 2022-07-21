import 'package:e_book_app/presetations/searching/controller/category_book_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelectFilterBTS extends GetView<CategoryBookController> {
  const SelectFilterBTS({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return Container(
      decoration: BoxDecoration(
        color: colorScheme.background,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
      ),
      child: ListView(
        padding: const EdgeInsets.all(12),
        shrinkWrap: true,
        children: [
          Text(
            'Sort By',
            style: textTheme.titleLarge,
          ),
          const Divider(),
          ListTile(
            title: Text(
              'Default',
              style: textTheme.titleSmall,
            ),
            onTap: () {
              controller.sortById();
              Get.back();
            },
          ),
          ListTile(
            title: Text(
              'Name',
              style: textTheme.titleSmall,
            ),
            onTap: () {
              controller.sortByName();
              Get.back();
            },
          ),
          ListTile(
            title: Text(
              'Date',
              style: textTheme.titleSmall,
            ),
            onTap: () {
              controller.sortByDate();
              Get.back();
            },
          ),
        ],
      ),
    );
  }
}
