import 'package:e_book_app/presetations/library/pages/download_book_list.dart';
import 'package:e_book_app/presetations/library/pages/fav_book_list.dart';
import 'package:flutter/material.dart';

class LibPage extends StatelessWidget {
  const LibPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Library'),
      ),
      body: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            TabBar(
                labelStyle:
                    textTheme.titleSmall!.copyWith(color: colorScheme.primary),
                labelColor: colorScheme.primary,
                isScrollable: true,
                indicatorSize: TabBarIndicatorSize.label,
                tabs: const [
                  Tab(
                    text: 'Favorate',
                  ),
                  Tab(
                    text: 'Download',
                  )
                ]),
            const SizedBox(
              height: 12,
            ),
            const Expanded(
              child: TabBarView(
                children: [
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
