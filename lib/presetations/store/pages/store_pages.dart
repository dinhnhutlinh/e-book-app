import 'package:e_book_app/models/category.dart';
import 'package:e_book_app/presetations/store/controllers/store_controller.dart';
import 'package:e_book_app/presetations/store/widget/book_by_category_list.dart';
import 'package:e_book_app/presetations/store/widget/lastest_book_list.dart';
import 'package:e_book_app/themes/app_colors.dart';
import 'package:e_book_app/themes/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StorePage extends StatelessWidget {
  StorePage({Key? key}) : super(key: key);

  final _storeController = Get.put(StoreController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 16, left: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Khám phá',
                    style: AppTextStyle.headerWhite,
                  ),
                  RawMaterialButton(
                    onPressed: () {},
                    elevation: 0,
                    fillColor: Colors.white.withOpacity(0.2),
                    padding: const EdgeInsets.all(8),
                    shape: const CircleBorder(),
                    child: const Icon(
                      Icons.find_in_page,
                      color: AppColors.white,
                      size: 24.0,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: AppColors.blueBackground,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                ),
                width: Get.width,
                child: ListView(
                  addAutomaticKeepAlives: true,
                  padding: const EdgeInsets.only(top: 16, right: 16, left: 16),
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          'Sách mới nhất',
                          style: AppTextStyle.textBlue,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const LastestBookList(),
                    Obx(
                      () => Column(
                        children: [
                          for (Category category in _storeController.category)
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 8,
                                ),
                                TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    '${category.name}',
                                    style: AppTextStyle.textBlue,
                                  ),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                BookByCategoryList(
                                  category: category,
                                ),
                              ],
                            )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
