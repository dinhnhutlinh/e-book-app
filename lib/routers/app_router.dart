import 'package:e_book_app/presetations/admin/books/pages/book_edit_page.dart';
import 'package:e_book_app/presetations/admin/books/pages/books_page.dart';
import 'package:e_book_app/presetations/admin/categorys/pages/categories_page.dart';
import 'package:e_book_app/presetations/admin/categorys/pages/category_detail_page.dart';
import 'package:e_book_app/presetations/admin/dashboard/controller/dashbroad_binding.dart';
import 'package:e_book_app/presetations/admin/dashboard/pages/dashbroad_page.dart';
import 'package:e_book_app/presetations/auth/pages/sign_in_page.dart';
import 'package:e_book_app/presetations/book_detail/controllers/book_detail_binding.dart';
import 'package:e_book_app/presetations/book_detail/pages/book_detail_page.dart';
import 'package:e_book_app/presetations/home/controllers/home_binding.dart';
import 'package:e_book_app/presetations/home/pages/home_page.dart';
import 'package:e_book_app/presetations/reading/controller/book_viewer_binding.dart';
import 'package:e_book_app/presetations/reading/pages/book_viewer_page.dart';
import 'package:e_book_app/presetations/searching/binding/category_book_binding.dart';
import 'package:e_book_app/presetations/searching/binding/seaching_book_binding.dart';
import 'package:e_book_app/presetations/searching/pages/category_book_page.dart';
import 'package:e_book_app/presetations/searching/pages/searching_page.dart';
import 'package:e_book_app/presetations/user/controllers/edit_profile_controller.dart';
import 'package:e_book_app/presetations/user/pages/user_edit_profile.dart';
import 'package:get/get.dart';

class Routes {
  static List<GetPage> router() {
    return <GetPage>[
      GetPage(
        name: SignInPage.route,
        page: () => SignInPage(),
      ),
      GetPage(
        name: HomePage.route,
        page: () => const HomePage(),
        binding: HomeBinding(),
      ),
      GetPage(
        name: DashboardPage.name,
        page: () => const DashboardPage(),
        binding: DashboardBinding(),
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
        name: BookViewerPage.route,
        page: () => const BookViewerPage(),
        binding: BookViewerBinding(),
      ),
      GetPage(
        name: SearchingPage.route,
        page: () => SearchingPage(),
        binding: SearchingBookBinding(),
      ),
      GetPage(
        name: CategoryBookPage.route,
        page: () => const CategoryBookPage(),
        binding: CategoryBookBinding(),
      ),
      GetPage(
        name: BookDetailPage.route,
        page: () => const BookDetailPage(),
        binding: BookDetailBinding(),
      ),
      GetPage(
        name: UserEditProfile.route,
        page: () => const UserEditProfile(),
        binding: BindingsBuilder(() {
          Get.put(EditProfileController());
        }),
      ),
    ];
  }
}
