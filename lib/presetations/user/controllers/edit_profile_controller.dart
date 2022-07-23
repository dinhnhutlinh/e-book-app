import 'dart:io';

import 'package:e_book_app/common_widget/stateless/app_alert_dialog.dart';
import 'package:e_book_app/presetations/user/controllers/user_controller.dart';
import 'package:e_book_app/services/user_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class EditProfileController extends GetxController {
  final _userService = Get.find<UserService>();
  String _avatar = '';
  final Rxn<File> _fileImage = Rxn<File>();
  bool wasChangeImage = false;
  final ImagePicker _imagePicker = ImagePicker();

  late String email;
  TextEditingController? userName;
  @override
  void onInit() {
    final profile = Get.find<UserController>().profile!;

    _avatar = profile.avatar ?? '';
    userName = TextEditingController(text: profile.name);
    email = profile.email ?? '';
    super.onInit();
  }

  pickImage() async {
    final image = await _imagePicker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      _fileImage.value = File(image.path);
    }
  }

  submit() async {
    await EasyLoading.show();
    if (_fileImage.value != null) {
      final linkAvatar = await _userService
          .uploadAvatar(
              image: _fileImage.value!, uid: Get.find<UserController>().uid)
          .catchError((error, stackTrace) {
        AppAlertDialog.show(title: 'Error', content: 'Can\'t upload image');
      });
      final copy = Get.find<UserController>()
          .profile!
          .copyWith(avatar: linkAvatar, name: userName!.text);
      final profile = _userService.uploadProfile(profile: copy);

      Get.find<UserController>().setProfile(profile);
    } else {
      final copy =
          Get.find<UserController>().profile!.copyWith(name: userName!.text);
      final profile = _userService.uploadProfile(profile: copy);
      Get.find<UserController>().setProfile(profile);
    }
    await EasyLoading.dismiss();
    Get.back();
  }

  File? get file => _fileImage.value;
  String get avatar => _avatar;
}
