import 'package:dynamic_color/dynamic_color.dart';
import 'package:e_book_app/configs/defind.dart';
import 'package:e_book_app/presetations/auth/pages/sign_in_page.dart';
import 'package:e_book_app/presetations/home/pages/home_page.dart';
import 'package:e_book_app/routers/app_router.dart';
import 'package:e_book_app/services/auth_service.dart';
import 'package:e_book_app/themes/color_schemes.g.dart';
import 'package:e_book_app/themes/custom_color.g.dart';
import 'package:e_book_app/utils/langs.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'firebase_options.dart';
import 'presetations/app_binding.dart';

Future<void> main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await Hive.initFlutter();
  await initServices();
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..userInteractions = true
    ..maskColor = Colors.black.withOpacity(0.2)
    ..dismissOnTap = false;
  runApp(const MyApp());
}

Future<void> initServices() async {
  Get.lazyPut(() => AuthService());
  await Hive.openBox(Define.dbName);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mode = Hive.box(Define.dbName)
        .get('themeMode', defaultValue: ThemeMode.system.name);
    return DynamicColorBuilder(
        builder: (ColorScheme? lightDynamic, ColorScheme? darkDynamic) {
      ColorScheme lightScheme;
      ColorScheme darkScheme;

      if (lightDynamic != null && darkDynamic != null) {
        lightScheme = lightDynamic.harmonized();
        lightCustomColors = lightCustomColors.harmonized(lightScheme);

        // Repeat for the dark color scheme.
        darkScheme = darkDynamic.harmonized();
        darkCustomColors = darkCustomColors.harmonized(darkScheme);
      } else {
        // Otherwise, use fallback schemes.
        lightScheme = lightColorScheme;
        darkScheme = darkColorScheme;
      }

      return GetMaterialApp(
        translations: Langs(),
        locale: Get.deviceLocale!,
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: lightScheme,
          backgroundColor: lightScheme.background,
          extensions: [lightCustomColors],
        ),
        darkTheme: ThemeData(
          useMaterial3: true,
          colorScheme: darkScheme,
          extensions: [darkCustomColors],
        ),
        themeMode: mode == ThemeMode.system.name
            ? ThemeMode.system
            : mode == ThemeMode.light.name
                ? ThemeMode.light
                : ThemeMode.dark,
        builder: EasyLoading.init(),
        getPages: Routes.router(),
        initialBinding: AppBinding(),
        initialRoute: Get.find<AuthService>().user != null
            ? HomePage.route
            : SignInPage.route,
      );
    });
  }
}
