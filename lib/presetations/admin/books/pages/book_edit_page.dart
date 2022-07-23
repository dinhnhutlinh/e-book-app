import 'package:e_book_app/common_widget/stateful/input_from.dart';
import 'package:e_book_app/common_widget/stateless/custom_round_button.dart';
import 'package:e_book_app/models/book.dart';
import 'package:e_book_app/utils/vadidator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookEditPage extends StatelessWidget {
  static const route = '/BookEdit';
  final Book _category = Get.arguments;

  final _nameController = TextEditingController();
  final _keyForm = GlobalKey<FormState>();

  BookEditPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _nameController.text = _category.name ?? '';
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(),
        title: const Text(
          'Chỉnh sửa danh mục',
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
                      const Text(
                        'Tên',
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      InputForm(
                        controller: _nameController,
                        validator: (value) =>
                            Validator().isNotNullAndEmpty('Tên', value),
                      ),
                    ],
                  ),
                ),
                CustomRoundButton(
                  onPress: () {
                    if (_keyForm.currentState?.validate() ?? false) {
                      // _categoriesController.updateOrCreateCat(
                      //   _category.copyWith(
                      //     name: _nameController.text,
                      //     updateAt: DateTime.now(),
                      //   ),
                      // );
                    }
                  },
                  title: 'Lưu',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
