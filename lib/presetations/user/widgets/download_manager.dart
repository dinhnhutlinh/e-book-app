import 'package:e_book_app/presetations/library/controller/download_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DownloadManager extends GetView<DownloadController> {
  const DownloadManager({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      decoration: BoxDecoration(
        color: colorScheme.onInverseSurface,
      ),
      child: ListView(
        padding: const EdgeInsets.all(12),
        shrinkWrap: true,
        children: [
          Text(
            'Storage manager',
            style: textTheme.titleLarge,
          ),
          const Divider(),
          const SizedBox(
            height: 12,
          ),
          ListTile(
            title: Text('Quatity books: ${controller.books.length}'),
          ),
          ListTile(
            title: Text(
                'Total storage :${(controller.getStorageLength() / 1024 / 1024).roundToDouble()} MB'),
          ),
          const SizedBox(
            height: 24,
          ),
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              // Foreground color
              onPrimary: Theme.of(context).colorScheme.primaryContainer,
              // Background color
              primary: Theme.of(context).colorScheme.primary,
            ),
            onPressed: () {
              controller.removeAllFileLocal();
              Get.back();
            },
            icon: const Icon(Icons.delete),
            label: const Text('Delete all file'),
          ),
          const SizedBox(
            height: 24,
          ),
        ],
      ),
    );
  }
}
