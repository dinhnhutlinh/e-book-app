import 'package:e_book_app/models/book.dart';
import 'package:e_book_app/presetations/admin/books/controller/books_controller.dart';
import 'package:e_book_app/presetations/admin/books/pages/book_edit_page.dart';
import 'package:e_book_app/presetations/admin/dashboard/widgets/manager_tile.dart';
import 'package:e_book_app/utils/string_util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BooksPage extends StatelessWidget {
  final _bookController = Get.find<BooksController>();
  static const route = '/BooksManager';

  BooksPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _bookController.query('');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        title: Text(
          'Book'.tr,
        ),
      ),
      floatingActionButton: Obx(
        () => Visibility(
          visible: _bookController.isVisibleFloatButton,
          child: FloatingActionButton(
            onPressed: () => Get.toNamed(
              BookEditPage.route,
              arguments: Book(
                id: StringUtil.getRandomString(8),
              ),
            ),
            child: const Icon(
              Icons.add,
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 12,
              right: 12,
              left: 12,
            ),
            child: TextField(
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                hintText: 'Search by name'.tr,
              ),
              maxLines: 1,
              onChanged: _bookController.query,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(
                    12,
                  ),
                  topRight: Radius.circular(
                    12,
                  ),
                ),
              ),
              child: Obx(
                () => _bookController.wasLoad
                    ? RefreshIndicator(
                        onRefresh: _bookController.fetchData,
                        child: ListView(
                            controller: _bookController.scollController,
                            padding: const EdgeInsets.all(12),
                            children: [
                              for (Book book in _bookController.books)
                                ManagerTile(
                                  title: Text(book.name ?? ''),
                                  subTitle: Text('ID: ${book.id} '),
                                  trailing: const Icon(Icons.edit),
                                  onPress: () => Get.toNamed(
                                    BookEditPage.route,
                                    arguments: book,
                                  ),
                                )
                            ]),
                      )
                    : const Center(
                        child: CircularProgressIndicator(),
                      ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
