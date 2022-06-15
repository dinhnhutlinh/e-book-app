import 'package:e_book_app/models/category.dart';
import 'package:e_book_app/services/category_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class CategoriesController extends GetxController {
  final _categoryServices = Get.find<CategoryService>();

  final RxList<Category> _items = <Category>[].obs;
  final RxBool _wasLoad = false.obs;
  final scollController = ScrollController();
  final RxBool _isShowFloatButton = true.obs;

  @override
  Future<void> onInit() async {
    scollController.addListener(() {
      if (scollController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        _isShowFloatButton.value = false;
      }
      if (scollController.position.userScrollDirection ==
          ScrollDirection.forward) {
        _isShowFloatButton.value = true;
      }
    });

    await fetchData();
    super.onInit();
  }

  Future<void> fetchData() async {
    await _categoryServices.getAll().then((value) {
      _items.value = value;
      _items.sort(
        (a, b) => b.updateAt!.compareTo(a.updateAt ?? DateTime.now()),
      );
    }).onError((error, stackTrace) {
      EasyLoading.showError('Lỗi');
    });
    _wasLoad.value = true;
  }

  Future<void> updateOrCreateCat(Category category) async {
    EasyLoading.show();
    await _categoryServices.addCat(category).then((value) async {
      _items.removeWhere((element) => element.id == category.id);
      _items.add(category);
      _items.sort(
        (a, b) => b.updateAt!.compareTo(
          a.updateAt ?? DateTime.now(),
        ),
      );
      await EasyLoading.showSuccess('Cập nhật thành công');
      Get.back();
    }).onError((error, stackTrace) async {
      await EasyLoading.showError(error.toString());
    });
  }

  Future<void> deleteCat(Category category) async {
    bool? confirm = await Get.dialog<bool>(
      AlertDialog(
        content: Text(
          'Xác nhận xóa ${category.name}',
        ),
        actions: [
          TextButton(
            child: const Text('Cancel'),
            onPressed: () => Get.back(
              result: false,
            ),
          ),
          TextButton(
            child: const Text('Confirm'),
            onPressed: () => Get.back(
              result: true,
            ),
          ),
        ],
      ),
    );
    if (confirm ?? false) {
      await _categoryServices.deleteCat(category).then((value) {
        _items.remove(category);
      });
    }
  }

  List<Category> get categories => _items;
  bool get wasLoad => _wasLoad.value;
  bool get isVisibleFloatButton => _isShowFloatButton.value;
}
