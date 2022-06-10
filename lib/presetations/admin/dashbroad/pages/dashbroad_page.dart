import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_book_app/assets.gen.dart';
import 'package:e_book_app/presetations/admin/books/pages/books_page.dart';
import 'package:e_book_app/presetations/admin/categorys/pages/categories_page.dart';
import 'package:e_book_app/presetations/admin/dashbroad/controller/dashbroad_controller.dart';
import 'package:e_book_app/presetations/admin/dashbroad/widgets/cat_button.dart';
import 'package:e_book_app/presetations/admin/dashbroad/widgets/manager_tile.dart';
import 'package:e_book_app/presetations/home/pages/home_page.dart';
import 'package:e_book_app/themes/app_colors.dart';
import 'package:e_book_app/themes/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashbroadPage extends StatelessWidget {
  static const name = '/Dashbroad';

  DashbroadPage({Key? key}) : super(key: key);

  final _control = Get.find<DashbroadController>();

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
              const SizedBox(
                height: 16,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 16, left: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Dashbroad',
                      style: AppTextStyle.headerWhite,
                    ),
                    RawMaterialButton(
                      onPressed: () => Get.offAndToNamed(
                        HomePage.route,
                      ),
                      elevation: 0,
                      fillColor: Colors.white.withOpacity(0.2),
                      padding: const EdgeInsets.all(8),
                      shape: const CircleBorder(),
                      child: CachedNetworkImage(
                        imageUrl: _control.profile?.avatar ?? '',
                        placeholder: (context, url) =>
                            const CircularProgressIndicator(),
                        errorWidget: (context, url, error) =>
                            Assets.resources.icons.user.svg(),
                        imageBuilder: (context, imageProvider) => Container(
                          width: 56,
                          height: 56,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: imageProvider, fit: BoxFit.cover),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.only(right: 16, left: 16),
                  decoration: const BoxDecoration(
                    color: AppColors.blueBackground,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16),
                    ),
                  ),
                  width: Get.width,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(height: 16),
                        SizedBox(
                          height: 260,
                          child: GridView(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    childAspectRatio: 3 / 2,
                                    crossAxisSpacing: 16,
                                    mainAxisSpacing: 16),
                            children: const [
                              TitleIconButton(
                                title: 'Số lượng truy cập',
                                content: '1000',
                                primaryColor: AppColors.deepOrange,
                              ),
                              TitleIconButton(
                                title: 'Số lượng truy cập trong ngày',
                                content: '100',
                                primaryColor: Colors.green,
                              ),
                              TitleIconButton(
                                title: 'Tiền đã thanh toán',
                                content: '2000',
                                primaryColor: Colors.blue,
                              ),
                              TitleIconButton(
                                title: 'Số lượng sách',
                                content: '300',
                                primaryColor: AppColors.darkBlue,
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        ManagerTile(
                          title: const Text('Quản lý sách'),
                          subTitle: const Text('Số lượng ${30}'),
                          trailing: Assets.resources.icons.bookshelf.svg(
                            height: 36,
                          ),
                          onPress: () => Get.toNamed(BooksPage.route),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        ManagerTile(
                          title: const Text('Quản lý danh mục'),
                          subTitle: Obx(
                            () => Text('Số lượng ${_control.countCategories}'),
                          ),
                          trailing: Assets.resources.icons.alignLeftTwo.svg(
                            height: 36,
                            color: AppColors.deepOrange,
                          ),
                          onPress: () => Get.toNamed(
                            CategoriesPage.name,
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        ManagerTile(
                          title: const Text('Quản lý tác giả'),
                          subTitle: const Text('Số lượng ${30}'),
                          trailing: Assets.resources.icons.idCardH.svg(
                            height: 36,
                          ),
                          onPress: () {},
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        ManagerTile(
                          title: const Text('Quản lý người dùng'),
                          subTitle: const Text('Số lượng '),
                          trailing: Assets.resources.icons.personalPrivacy.svg(
                            height: 36,
                          ),
                          onPress: () {},
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
