import 'package:e_book_app/common_widget/stateful/input_from.dart';
import 'package:e_book_app/models/category.dart';
import 'package:e_book_app/presetations/admin/categorys/controller/categories_controller.dart';
import 'package:e_book_app/utils/vadidator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryEditPage extends StatelessWidget {
  static const route = '/CategoryDetail';
  final _categoriesController = Get.find<CategoriesController>();
  final Category _category = Get.arguments;

  final _nameController = TextEditingController();
  final _keyForm = GlobalKey<FormState>();

  CategoryEditPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _nameController.text = _category.name ?? '';
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(),
        title: Text(
          'Edit category'.tr,
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
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _keyForm,
            child: Column(
              children: [
                Expanded(
                  child: ListView(
                    children: [
                      Text(
                        'Name'.tr,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      InputForm(
                        controller: _nameController,
                        validator: (value) =>
                            Validator().isNotNullAndEmpty('Name'.tr, value),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: Get.width,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.only(
                          right: 32, left: 32, top: 12, bottom: 12),
                      // Foreground color
                      onPrimary: Theme.of(context).colorScheme.primaryContainer,
                      // Background color
                      primary: Theme.of(context).colorScheme.primary,
                    ),
                    child: Text('Save'.tr),
                    onPressed: () {
                      if (_keyForm.currentState?.validate() ?? false) {
                        _categoriesController.updateOrCreateCat(
                          _category.copyWith(
                            name: _nameController.text,
                            updateAt: DateTime.now(),
                          ),
                        );
                      }
                    },
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
