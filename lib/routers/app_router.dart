import 'package:e_book_app/presetations/admin/categorys/pages/categories_page.dart';
import 'package:e_book_app/presetations/admin/categorys/pages/category_detail_page.dart';
import 'package:e_book_app/presetations/admin/dashbroad/controller/dashbroad_binding.dart';
import 'package:e_book_app/presetations/admin/dashbroad/pages/dashbroad_page.dart';
import 'package:e_book_app/presetations/auth/pages/sign_in_page.dart';
import 'package:e_book_app/presetations/home/controllers/home_binding.dart';
import 'package:e_book_app/presetations/home/pages/home_page.dart';
import 'package:get/get.dart';

class Routes {
  static List<GetPage> router() {
    return <GetPage>[
      GetPage(
        name: SignInPage.route,
        page: () => SignInPage(),
      ),
      // GetPage(
      //   name: SignUpPage.route,
      //   page: () => SignUpPage(),
      // ),
      GetPage(
        name: HomePage.route,
        page: () => HomePage(),
        binding: HomeBinding(),
      ),
      GetPage(
        name: DashbroadPage.name,
        page: () => DashbroadPage(),
        binding: DashbroadBinding(),
      ),
      GetPage(
        name: CategoriesPage.name,
        page: () => CategoriesPage(),
      ),
      GetPage(
        name: CategoryDetailPage.route,
        page: () => CategoryDetailPage(),
      ),
    ];
  }
}
