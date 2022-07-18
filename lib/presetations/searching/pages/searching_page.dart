import 'package:e_book_app/common_widget/stateful/input_from.dart';
import 'package:e_book_app/presetations/searching/controller/searching_controller.dart';
import 'package:e_book_app/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchingPage extends GetView<SearchingController> {
  static const route = '/Searching';

  const SearchingPage({Key? key}) : super(key: key);

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
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () => Get.back(),
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        color: AppColors.white,
                      ),
                    ),
                    Expanded(
                      child: SizedBox(
                        height: 52,
                        width: double.infinity,
                        child: InputForm(
                          controller: TextEditingController(),
                          isPassword: false,
                          hintText: 'Tìm kiếm theo tên',
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                    color: AppColors.blueBackground,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12),
                    ),
                  ),
                  child: ListView(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
