import 'package:e_book_app/models/book.dart';
import 'package:e_book_app/common_widget/stateless/book_tile.dart';
import 'package:e_book_app/presetations/searching/pages/searching_page.dart';
import 'package:e_book_app/presetations/store/controllers/store_controller.dart';
import 'package:e_book_app/presetations/store/widget/categories_widget.dart';

import 'package:e_book_app/presetations/store/widget/trend_book_carousel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StorePage extends GetView<StoreController> {
  const StorePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorScheme.primaryContainer,
        title: Text('explore'.tr),
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
            child: controller.obx(
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
                      onPressed: controller.onInit,
                      child: const Text('Retry'),
                    )
                  ],
                ),
              ),
              (state) => SingleChildScrollView(
                child: Column(
                  children: [
                    const TrendBookCarousel(),
                    const SizedBox(
                      height: 8,
                    ),
                    const CategoriesWidget(),
                    const SizedBox(
                      height: 12,
                    ),
                    Obx(
                      () => Column(
                        children: [
                          for (Book book in controller.books)
                            BookTile(book: book),
                          Padding(
                            padding: const EdgeInsets.all(12),
                            child: OutlinedButton.icon(
                                icon: const Icon(Icons.search),
                                onPressed: () =>
                                    Get.toNamed(SearchingPage.route),
                                label: const Text('Find more')),
                          ),
                          if (controller.isLoadMore)
                            const Center(child: CircularProgressIndicator()),
                        ],
                      ),
                    ),
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
