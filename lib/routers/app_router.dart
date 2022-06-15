import 'package:e_book_app/presetations/admin/books/pages/book_edit_page.dart';
import 'package:e_book_app/presetations/admin/books/pages/books_page.dart';
import 'package:e_book_app/presetations/admin/categorys/pages/categories_page.dart';
import 'package:e_book_app/presetations/admin/categorys/pages/category_detail_page.dart';
import 'package:e_book_app/presetations/admin/dashbroad/controller/dashbroad_binding.dart';
import 'package:e_book_app/presetations/admin/dashbroad/pages/dashbroad_page.dart';
import 'package:e_book_app/presetations/auth/pages/sign_in_page.dart';
import 'package:e_book_app/presetations/home/controllers/home_binding.dart';
import 'package:e_book_app/presetations/home/pages/home_page.dart';
import 'package:e_book_app/presetations/reading/pages/book_viewer_page.dart';
import 'package:e_book_app/presetations/store/pages/book_detail_page.dart';
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
        name: CategoryEditPage.route,
        page: () => CategoryEditPage(),
      ),
      GetPage(
        name: BooksPage.route,
        page: () => BooksPage(),
      ),
      GetPage(
        name: BookEditPage.route,
        page: () => BookEditPage(),
      ),
      GetPage(
        name: BookDetailPage.route,
        page: () => BookDetailPage(),
      ),
      GetPage(
        name: BookViewerPage.route,
        page: () => BookViewerPage(),
      ),
    ];
  }
}
