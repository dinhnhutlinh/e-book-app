import 'package:e_book_app/models/download_model.dart';
import 'package:e_book_app/presetations/library/controller/download_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class DownloadBooKList extends GetView<DownloadController> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ListView(
        children: [
          for (DownloadModel download in controller.downloads)
            Text(download.location),
        ],
      ),
    );
  }
}
