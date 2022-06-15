import 'package:e_book_app/models/book.dart';
import 'package:e_book_app/presetations/admin/books/controller/books_controller.dart';
import 'package:e_book_app/presetations/admin/books/pages/book_edit_page.dart';
import 'package:e_book_app/presetations/admin/dashbroad/widgets/manager_tile.dart';
import 'package:e_book_app/themes/app_colors.dart';
import 'package:e_book_app/themes/app_text_style.dart';
import 'package:e_book_app/utils/string_util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class BooksPage extends StatelessWidget {
  final _bookController = Get.put(BooksController());
  static const route = '/BooksManager';

  BooksPage({Key? key}) : super(key: key);

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
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          iconTheme: const IconThemeData(
            color: AppColors.white,
          ),
          title: Text(
            'Sách',
            style: AppTextStyle.headerWhite,
          ),
        ),
        floatingActionButton: Obx(
          () => Visibility(
            visible: _bookController.isVisibleFloatButton,
            child: FloatingActionButton(
              backgroundColor: AppColors.deepOrange,
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
                right: 16,
                left: 16,
              ),
              child: TextField(
                style: AppTextStyle.inputWhite,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white.withOpacity(0.2),
                  border: InputBorder.none,
                  hintText: 'Tìm theo tên',
                  hintStyle: AppTextStyle.inputWhite,
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.circular(24),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.circular(24),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.circular(24),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: const BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.circular(24),
                  ),
                  errorStyle: GoogleFonts.openSans(
                    color: AppColors.deepOrange,
                  ),
                  contentPadding: const EdgeInsets.only(
                      right: 24, left: 24, top: 8, bottom: 8),
                ),
                maxLines: 1,
                cursorColor: AppColors.white,
                onChanged: _bookController.query,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Expanded(
              child: Container(
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
                child: Obx(
                  () => _bookController.wasLoad
                      ? RefreshIndicator(
                          onRefresh: _bookController.fetchData,
                          child: ListView.builder(
                            controller: _bookController.scollController,
                            padding: const EdgeInsets.all(16),
                            itemCount: _bookController.books.length,
                            itemBuilder: (context, index) => ManagerTile(
                              title:
                                  Text(_bookController.books[index].name ?? ''),
                              subTitle: Text(
                                  'ID: ${_bookController.books[index].id} '),
                              trailing: const Icon(Icons.edit),
                              onPress: () => Get.toNamed(
                                BookEditPage.route,
                                arguments: _bookController.books[index],
                              ),
                            ),
                          ),
                        )
                      : const Center(
                          child: CircularProgressIndicator(
                            color: AppColors.deepOrange,
                          ),
                        ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
