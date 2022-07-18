import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_book_app/assets.gen.dart';
import 'package:e_book_app/presetations/admin/dashboard/pages/dashbroad_page.dart';
import 'package:e_book_app/presetations/user/controllers/user_controller.dart';
import 'package:e_book_app/themes/app_colors.dart';
import 'package:e_book_app/themes/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserDetailPage extends StatelessWidget {
  final _userControl = Get.find<UserController>();

  UserDetailPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Obx(
        () => _userControl.isLoading
            ? const Center(
                child: CircularProgressIndicator(color: AppColors.white),
              )
            : SafeArea(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 16,
                    ),
                    SizedBox(
                      width: Get.width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white.withOpacity(0.2),
                            ),
                            child: CachedNetworkImage(
                              imageUrl: _userControl.profile?.avatar ?? '',
                              placeholder: (context, url) =>
                                  const CircularProgressIndicator(),
                              errorWidget: (context, url, error) =>
                                  Assets.resources.icons.user.svg(),
                              imageBuilder: (context, imageProvider) =>
                                  Container(
                                width: 120,
                                height: 120,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: imageProvider, fit: BoxFit.cover),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Text(
                            _userControl.profile?.name ?? '',
                            style: AppTextStyle.textWhite,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Expanded(
                      child: Container(
                        width: Get.width,
                        decoration: const BoxDecoration(
                          color: AppColors.blueBackground,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(16),
                            topRight: Radius.circular(16),
                          ),
                        ),
                        child: SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 16, right: 16, left: 16),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                if (_userControl.profile?.isAdmin ?? false)
                                  TextButton(
                                    onPressed: () =>
                                        Get.offNamed(DashboardPage.name),
                                    child: Text(
                                      'Vào bản điều khiển',
                                      style: AppTextStyle.textBlue,
                                    ),
                                  ),
                                TextButton(
                                  onPressed: _userControl.logout,
                                  child: Text(
                                    'Đăng xuất',
                                    style: AppTextStyle.textBlue,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
      ),
    );
  }
}
