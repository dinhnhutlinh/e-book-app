import 'package:e_book_app/configs/defind.dart';
import 'package:e_book_app/presetations/user/widgets/select_theme_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

class SettingController extends GetxController {
  final Rxn<ThemeMode> _themeMode = Rxn<ThemeMode>();

  ThemeMode get themeMode => _themeMode.value ?? ThemeMode.system;
  @override
  void onInit() {
    final mode = Hive.box(Define.dbName)
        .get('themeMode', defaultValue: ThemeMode.system.name);
    _themeMode.value = mode == ThemeMode.system.name
        ? ThemeMode.system
        : mode == ThemeMode.light.name
            ? ThemeMode.light
            : ThemeMode.dark;
    super.onInit();
  }

  void selectTheme() {
    Get.dialog(const SelectThemeDialog());
  }

  setTheme(ThemeMode mode) async {
    _themeMode.value = mode;
    Get.changeThemeMode(mode);
    final db = await Hive.openBox('App');
    db.put('themeMode', mode.name);
  }
}
