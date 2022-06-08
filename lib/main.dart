import 'package:e_book_app/injection.dart';
import 'package:e_book_app/presetations/app_binding.dart';
import 'package:e_book_app/presetations/auth/controllers/auth_controller.dart';
import 'package:e_book_app/presetations/auth/pages/sign_in_page.dart';
import 'package:e_book_app/presetations/home/pages/home_page.dart';
import 'package:e_book_app/routers/app_router.dart';
import 'package:e_book_app/themes/app_colors.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import 'firebase_options.dart';

Future<void> main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  await setupInjector();
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.dark
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = Colors.yellow
    ..backgroundColor = Colors.green
    ..indicatorColor = Colors.yellow
    ..textColor = Colors.yellow
    ..maskColor = Colors.blue.withOpacity(0.5)
    ..userInteractions = true
    ..maskColor = Colors.black.withOpacity(0.2)
    ..dismissOnTap = false;

  Get.put(AuthController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.darkBlue,
        ),
        useMaterial3: true,
      ),
      builder: EasyLoading.init(),
      getPages: Routes.router(),
      initialRoute: Get.find<AuthController>().isLogin
          ? HomePage.route
          : SignInPage.route,
      initialBinding: AppBinding(),
    );
  }
}
