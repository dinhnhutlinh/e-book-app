import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_book_app/assets.gen.dart';
import 'package:e_book_app/presetations/admin/books/pages/books_page.dart';
import 'package:e_book_app/presetations/admin/categorys/pages/categories_page.dart';
import 'package:e_book_app/presetations/admin/dashboard/controller/dashbroad_controller.dart';
import 'package:e_book_app/presetations/admin/dashboard/widgets/cat_button.dart';
import 'package:e_book_app/presetations/admin/dashboard/widgets/manager_tile.dart';
import 'package:e_book_app/presetations/home/pages/home_page.dart';
import 'package:e_book_app/presetations/user/controllers/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardPage extends GetView<DashboardController> {
  static const name = '/Dashbroad';

  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      body: Obx(
        () => !controller.wasLoad
            ? const Center(child: CircularProgressIndicator())
            : CustomScrollView(
                slivers: [
                  SliverAppBar(
                    backgroundColor: colorScheme.primaryContainer,
                    title: Text(
                      'Dashboard',
                      style: textTheme.displaySmall,
                    ),
                  ),
                  SliverList(
                    delegate: SliverChildListDelegate(
                      [
                        Container(
                          decoration: BoxDecoration(
                            color: colorScheme.primaryContainer,
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(12),
                              bottomRight: Radius.circular(12),
                            ),
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(12),
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: Column(
                                    children: [
                                      CircleAvatar(
                                        child: ClipOval(
                                          child: Obx(
                                            () => Get.find<UserController>()
                                                        .profile !=
                                                    null
                                                ? CachedNetworkImage(
                                                    imageUrl: Get.find<
                                                                UserController>()
                                                            .profile
                                                            ?.avatar ??
                                                        '',
                                                    width: 40,
                                                    height: 40,
                                                    fit: BoxFit.cover,
                                                    placeholder: (context,
                                                            url) =>
                                                        const CircularProgressIndicator(),
                                                    errorWidget:
                                                        (context, url, error) =>
                                                            Assets.resources
                                                                .icons.user
                                                                .svg(),
                                                  )
                                                : const CircularProgressIndicator(),
                                          ),
                                        ),
                                      ),
                                      TextButton(
                                          onPressed: () {
                                            Get.offAllNamed(HomePage.route);
                                          },
                                          child: const Text('Back to store'))
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 140,
                                child: Padding(
                                  padding: const EdgeInsets.all(12),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: TitleIconButton(
                                          title: 'Book'.tr,
                                          content: '${controller.countBook}',
                                          primaryColor: Colors.orange,
                                        ),
                                      ),
                                      Expanded(
                                        child: TitleIconButton(
                                          title: 'Category'.tr,
                                          content:
                                              '${controller.countCategory}',
                                          primaryColor: Colors.green,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12),
                          child: ManagerTile(
                            title: const Text('Book manager'),
                            subTitle:
                                Text('${'Quatity'.tr} ${controller.countBook}'),
                            trailing: Assets.resources.icons.bookshelf.svg(
                              height: 36,
                            ),
                            onPress: () => Get.toNamed(BooksPage.route),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              right: 12, left: 12, bottom: 12),
                          child: ManagerTile(
                            title: const Text('Category manager'),
                            subTitle: Text(
                                '${'Quatity'.tr} ${controller.countCategory}'),
                            trailing: Assets.resources.icons.alignLeftTwo.svg(
                              height: 36,
                            ),
                            onPress: () => Get.toNamed(CategoriesPage.name),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
