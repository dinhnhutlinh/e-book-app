import 'package:dio/dio.dart';
import 'package:e_book_app/common_widget/stateful/custom_alert.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DownloadAlert extends StatefulWidget {
  final String url;
  final String path;

  const DownloadAlert({Key? key, required this.url, required this.path})
      : super(key: key);

  @override
  State<DownloadAlert> createState() => _DownloadAlertState();
}

class _DownloadAlertState extends State<DownloadAlert> {
  Dio dio = Dio();
  int received = 0;
  String progress = '0';
  int total = 0;

  download() async {
    await dio.download(
      widget.url,
      widget.path,
      deleteOnError: true,
      onReceiveProgress: (receivedBytes, totalBytes) {
        if (mounted) {
          setState(() {
            received = receivedBytes;
            total = totalBytes;
            progress = (received / total * 100).toStringAsFixed(0);
          });
        }

        //Check if download is complete and close the alert dialog
        if (receivedBytes == totalBytes) {
          Get.back<bool>(result: true);
        }
      },
    );
  }

  @override
  void initState() {
    super.initState();
    download();
  }

  @override
  void dispose() {
    dio.close(force: true);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: CustomAlert(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                '${'Downloading'.tr}...',
                style: const TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 20.0),
              Container(
                height: 5,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: LinearProgressIndicator(
                  value: double.parse(progress) / 100.0,
                  valueColor: AlwaysStoppedAnimation(
                      Theme.of(context).colorScheme.secondary),
                  backgroundColor:
                      Theme.of(context).colorScheme.secondary.withOpacity(0.3),
                ),
              ),
              const SizedBox(height: 5.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    '$progress %',
                    style: const TextStyle(
                      fontSize: 13.0,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
              ButtonBar(
                children: [
                  TextButton(
                      onPressed: () {
                        Get.back<bool>(result: false);
                      },
                      child: Text('Cancel'.tr))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
