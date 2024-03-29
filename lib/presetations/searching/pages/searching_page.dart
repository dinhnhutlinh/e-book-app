import 'package:e_book_app/assets.gen.dart';
import 'package:e_book_app/common_widget/stateless/book_tile.dart';
import 'package:e_book_app/models/book.dart';
import 'package:e_book_app/presetations/searching/controller/searching_controller.dart';
import 'package:e_book_app/presetations/searching/widgets/categories_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchingPage extends GetView<SearchingController> {
  static const route = '/Searching';

  SearchingPage({Key? key}) : super(key: key);
  final txtController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('search'.tr)),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: TextField(
                decoration: InputDecoration(
                  suffixIcon: InkWell(
                      onTap: () =>
                          controller.searchWithQuery(txtController.text),
                      child: const Icon(Icons.search)),
                  hintText: 'searching book'.tr,
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(12),
                    ),
                  ),
                ),
                onSubmitted: controller.searchWithQuery,
                onChanged: (value) {
                  if (value == '') {
                    controller.refreshResult();
                  }
                }),
          ),
          Expanded(
            child: controller.obx(
                (state) => Obx(
                      () => controller.book.isEmpty
                          ? Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Assets.resources.images.search
                                    .image(width: Get.width / 2),
                                const SizedBox(height: 8),
                                const Text('Find your book'),
                              ],
                            )
                          : ListView(
                              children: [
                                for (Book book in controller.book)
                                  BookTile(book: book),
                              ],
                            ),
                    ),
                // onEmpty: ,
                onLoading: const Center(
                  child: CircularProgressIndicator(),
                ),
                onEmpty: CategoriesWidget()),
          ),
        ],
      ),
    );
  }
}
