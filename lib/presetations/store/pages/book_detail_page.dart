import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_book_app/assets.gen.dart';
import 'package:e_book_app/common_widget/stateless/custom_round_button.dart';
import 'package:e_book_app/presetations/reading/pages/book_viewer_page.dart';
import 'package:e_book_app/presetations/store/controllers/book_detail_controller.dart';
import 'package:e_book_app/themes/app_colors.dart';
import 'package:e_book_app/themes/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class BookDetailPage extends StatelessWidget {
  static const route = '/BookDetail';
  final _bookDetailController = Get.put(BookDetailController());

  BookDetailPage({Key? key}) : super(key: key);

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
          iconTheme: const IconThemeData(color: Colors.white),
          actions: [
            Obx(
              () => IconButton(
                onPressed: _bookDetailController.wasLike
                    ? _bookDetailController.unLikeBook
                    : _bookDetailController.likeBook,
                icon: _bookDetailController.wasLike
                    ? Assets.resources.icons.like.svg()
                    : Assets.resources.icons.book.svg(),
              ),
            )
          ],
        ),
        body: Stack(
          children: [
            SizedBox(
              height: 336,
              child: Column(
                children: [
                  _cardBook(),
                  const SizedBox(
                    height: 16,
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
                child: Padding(
              padding: const EdgeInsets.only(top: 336),
              child: Container(
                height: Get.height - 336,
                decoration: const BoxDecoration(
                  color: AppColors.blueBackground,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                ),
                padding: const EdgeInsets.all(16),
                child: ListView(
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    const SizedBox(
                      child: ListTile(
                        title: Text("Nội dung"),
                      ),
                    ),
                    Text(
                      _bookDetailController.book.content ?? '',
                    ),
                  ],
                ),
              ),
            )),
          ],
        ),
      ),
    );
  }

  _cardBook() {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(
                height: 192,
                width: 128,
                child: Card(
                  clipBehavior: Clip.antiAlias,
                  child: CachedNetworkImage(
                    imageUrl: _bookDetailController.book.linkImgOnl ?? '',
                    fit: BoxFit.cover,
                    placeholder: (context, url) => Shimmer.fromColors(
                      baseColor: AppColors.white,
                      highlightColor: AppColors.orange.withOpacity(0.2),
                      child: const Card(margin: EdgeInsets.zero),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              Expanded(
                child: SizedBox(
                  height: 192,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            _bookDetailController.book.name ?? '',
                            style: AppTextStyle.buttonWhite,
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Assets.resources.icons.alignLeftTwo.svg(),
                                const SizedBox(
                                  width: 8,
                                ),
                                Expanded(
                                  child: Text(
                                    _bookDetailController.book.category?.name ??
                                        "",
                                    style: AppTextStyle.textWhite,
                                    overflow: TextOverflow.fade,
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Assets.resources.icons.idCardH
                                    .svg(color: AppColors.white, height: 24),
                                const SizedBox(
                                  width: 8,
                                ),
                                Expanded(
                                  child: Text(
                                    _bookDetailController.book.author ?? "",
                                    style: AppTextStyle.labelWhite,
                                    maxLines: 3,
                                    overflow: TextOverflow.fade,
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          CustomRoundButton(
              onPress: () => Get.toNamed(
                    BookViewerPage.route,
                    arguments: _bookDetailController.book,
                  ),
              title: 'Đọc miễn phí'),
          const SizedBox(
            height: 16,
          ),
          CustomRoundButton(
            onPress: () {},
            title: 'Mua với giá ${_bookDetailController.book.price ?? ''} VND',
          ),
        ],
      ),
    );
  }
}
