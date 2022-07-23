import 'package:e_book_app/common_widget/stateless/book_tile.dart';
import 'package:e_book_app/models/book.dart';
import 'package:e_book_app/presetations/searching/controller/category_book_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryBookPage extends GetView<CategoryBookController> {
  static const route = '/CategoryBook';

  const CategoryBookPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: controller.obx(
        onLoading: const Center(
          child: CircularProgressIndicator(),
        ),
        (state) => Obx(
          () => CustomScrollView(
            slivers: [
              SliverAppBar(
                floating: true,
                pinned: true,
                title: Text(controller.categoy.name ?? ''),
                bottom: PreferredSize(
                  preferredSize: const Size(50, 72),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: TextButton(
                        onPressed: controller.selectFilter,
                        child: Text(
                          '${'Sort by'.tr}: ${controller.sortBy.value.tr}',
                          style: textTheme.button?.copyWith(
                              fontSize: 18, color: colorScheme.primary),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    for (Book book in controller.book) BookTile(book: book),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
