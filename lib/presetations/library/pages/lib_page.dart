import 'package:e_book_app/presetations/library/pages/download_book_list.dart';
import 'package:e_book_app/presetations/library/pages/fav_book_list.dart';
import 'package:e_book_app/presetations/library/pages/reading_progress.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LibPage extends StatelessWidget {
  const LibPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorScheme.primaryContainer,
        title: Text('Library'.tr),
      ),
      body: DefaultTabController(
        length: 3,
        child: Column(
          children: [
            TabBar(
                labelStyle:
                    textTheme.titleSmall!.copyWith(color: colorScheme.primary),
                labelColor: colorScheme.primary,
                isScrollable: true,
                // indicatorSize: TabBarIndicatorSize.label,
                indicatorColor: colorScheme.primary,
                tabs: [
                  Tab(
                    text: 'Progresss'.tr,
                  ),
                  Tab(
                    text: 'Favorate'.tr,
                  ),
                  Tab(
                    text: 'Downloaded'.tr,
                  ),
                ]),
            const SizedBox(
              height: 12,
            ),
            const Expanded(
              child: TabBarView(
                children: [
                  ReadingProgress(),
                  FavoriteBookList(),
                  DownloadBooKList(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
