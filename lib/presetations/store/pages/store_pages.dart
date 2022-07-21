import 'package:e_book_app/models/book.dart';
import 'package:e_book_app/presetations/admin/categorys/controller/categories_controller.dart';
import 'package:e_book_app/presetations/library/widget/book_tile.dart';
import 'package:e_book_app/presetations/searching/pages/category_book_page.dart';
import 'package:e_book_app/presetations/searching/pages/searching_page.dart';
import 'package:e_book_app/presetations/store/controllers/store_controller.dart';
import 'package:e_book_app/presetations/store/widget/lastest_book_list.dart';
import 'package:e_book_app/utils/custom_color.g.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StorePage extends StatelessWidget {
  StorePage({Key? key}) : super(key: key);

  final _storeController = Get.put(StoreController());

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text('Explore'),
        actions: [
          IconButton(
            onPressed: () => Get.toNamed(SearchingPage.route),
            icon: const Icon(
              Icons.search,
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: _storeController.obx(
              onLoading: const Center(
                child: CircularProgressIndicator(),
              ),
              onError: (error) => Center(
                child: Column(
                  children: [
                    const Text('Error'),
                    const SizedBox(
                      height: 8,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(),
                      onPressed: _storeController.onInit,
                      child: const Text('Retry'),
                    )
                  ],
                ),
              ),
              (state) => SingleChildScrollView(
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Text(
                          'News books',
                          style: textTheme.titleLarge,
                        ),
                      ),
                    ),
                    LastestBookList(),
                    const SizedBox(
                      height: 8,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 12, bottom: 12),
                        child: Text(
                          'Category',
                          style: textTheme.titleMedium,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 42,
                      child: GetBuilder<CategoriesController>(
                        init: Get.find<CategoriesController>(),
                        builder: (controller) => ListView.builder(
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
                                primary: customcolor1,
                                // Foreground color
                                elevation: 0,
                                onPrimary:
                                    Theme.of(context).colorScheme.onPrimary,
                              ).copyWith(
                                  elevation: ButtonStyleButton.allOrNull(0.0)),
                              onPressed: () => Get.toNamed(
                                  CategoryBookPage.route,
                                  arguments: controller.categories[index]),
                              child: Text(
                                controller.categories[index].name ?? '',
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    for (Book book in _storeController.books)
                      BookTile(book: book),
                    if (_storeController.isLoadMore)
                      const Center(child: CircularProgressIndicator()),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
