import 'package:e_book_app/common_widget/stateful/input_from.dart';
import 'package:e_book_app/common_widget/stateless/custom_round_button.dart';
import 'package:e_book_app/models/category.dart';
import 'package:e_book_app/presetations/admin/categorys/controller/categories_controller.dart';
import 'package:e_book_app/themes/app_colors.dart';
import 'package:e_book_app/themes/app_text_style.dart';
import 'package:e_book_app/utils/vadidator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryDetailPage extends StatelessWidget {
  static const route = '/CategoryDetail';
  final _categoriesController = Get.find<CategoriesController>();
  final Category _category = Get.arguments;

  final _nameController = TextEditingController();
  final _keyForm = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    _nameController.text = _category.name ?? '';
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
            'Chỉnh sửa danh mục',
            style: AppTextStyle.headerWhite,
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
                          'Tên',
                          style: AppTextStyle.labelBlue,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        InputForm(
                          controller: _nameController,
                          isPassword: false,
                          hintText: 'Nhập tên danh mục',
                          isLight: false,
                          validator: (value) =>
                              Validator().isNotNullAndEmpty('Tên', value),
                        ),
                      ],
                    ),
                  ),
                  CustomRoundButton(
                    onPress: () {
                      if (_keyForm.currentState?.validate() ?? false) {
                        _categoriesController.updateOrCreateCat(
                          _category.copyWith(
                            name: _nameController.text,
                            updateAt: DateTime.now(),
                          ),
                        );
                      }
                    },
                    title: 'Lưu',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
