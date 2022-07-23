import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_book_app/presetations/user/controllers/edit_profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserEditProfile extends GetView<EditProfileController> {
  static const route = '/EditProfile';
  const UserEditProfile({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit profile'),
        actions: [
          TextButton(
            onPressed: controller.submit,
            child: const Text('Submit'),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(12),
        shrinkWrap: true,
        children: [
          Align(
            alignment: Alignment.center,
            child: Column(
              children: [
                CircleAvatar(
                  radius: 45,
                  backgroundColor: colorScheme.primaryContainer,
                  child: ClipOval(
                    child: Obx(
                      () => controller.file == null
                          ? CachedNetworkImage(
                              imageUrl: controller.avatar,
                              width: 90.0,
                              height: 90.0,
                              fit: BoxFit.fill,
                            )
                          : Image.file(
                              controller.file!,
                              height: 90,
                              width: 90,
                              fit: BoxFit.fill,
                            ),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: controller.pickImage,
                  child: const Text(
                    'Select Image',
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          TextField(
            controller: controller.userName,
            decoration: const InputDecoration(
              labelText: 'Name',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          TextField(
            enabled: false,
            controller: TextEditingController(text: controller.email),
            decoration: const InputDecoration(
              labelText: 'Email',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(
            height: 36,
          ),
        ],
      ),
    );
  }
}
