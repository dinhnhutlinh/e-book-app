import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path/path.dart' show basename;

import 'package:e_book_app/models/category.dart';
import 'package:e_book_app/presetations/admin/books/controller/book_edit_controller.dart';
import 'package:e_book_app/presetations/admin/categorys/controller/categories_controller.dart';
import 'package:e_book_app/utils/vadidator.dart';

class BookEditPage extends StatelessWidget {
  static const route = '/BookEdit';
  final controller = Get.put(BookEditController());
  final _categoryController = Get.find<CategoriesController>();

  BookEditPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(),
        title: Text(
          'Edit book'.tr,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: controller.submit,
          ),
        ],
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
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            child: Column(
              children: [
                Expanded(
                  child: ListView(
                    children: [
                      Column(
                        children: [
                          ClipRRect(
                            child: Obx(
                              () => controller.localImage.value == null
                                  ? CachedNetworkImage(
                                      imageUrl:
                                          controller.book.linkImgOnl ?? '',
                                      errorWidget: (context, url, error) =>
                                          Center(
                                              child: Text('Select image'.tr)),
                                      width: 128,
                                      height: 192,
                                      fit: BoxFit.fill,
                                    )
                                  : Image.file(
                                      controller.localImage.value!,
                                      width: 128,
                                      height: 192,
                                      fit: BoxFit.fill,
                                    ),
                            ),
                          ),
                          TextButton(
                            onPressed: controller.pickImage,
                            child: Text(
                              'Select image'.tr,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            labelText: 'Name'.tr),
                        controller: controller.name,
                        validator: (value) =>
                            Validator().isNotNullAndEmpty('Name'.tr, value),
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            labelText: 'Author'.tr),
                        controller: controller.author,
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      DropdownButtonFormField<Category>(
                        value: controller.category.value,
                        decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            labelText: 'Category'.tr),
                        items: _categoryController.categories
                            .map<DropdownMenuItem<Category>>(
                              (e) => DropdownMenuItem(
                                value: e,
                                child: Text(e.name ?? ''),
                              ),
                            )
                            .toList(),
                        onChanged: (value) {
                          controller.category.value = value;
                        },
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            labelText: 'Price'.tr),
                        controller: controller.price,
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      Obx(
                        () => ListTile(
                          title: Text(controller.fileLocal.value == null
                              ? controller.book.linkfileOnl ?? 'Select File'
                              : basename(controller.fileLocal.value!.path)),
                          trailing: Text(
                            'Select',
                            style: TextStyle(color: colorScheme.primary),
                          ),
                          onTap: controller.selectFilePdf,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                                color: colorScheme.onSurface, width: 1),
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            labelText: 'Content'.tr),
                        controller: controller.content,
                        maxLines: null,
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
