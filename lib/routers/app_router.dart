import 'package:e_book_app/presetations/auth/pages/sign_in_page.dart';
import 'package:e_book_app/presetations/auth/pages/sign_up_page.dart';
import 'package:e_book_app/presetations/home/pages/home_page.dart';
import 'package:get/get.dart';

class Routes {
  static List<GetPage> router() {
    return <GetPage>[
      GetPage(
        name: SignInPage.route,
        page: () => SignInPage(),
      ),
      GetPage(
        name: SignUpPage.route,
        page: () => SignUpPage(),
      ),
      GetPage(
        name: HomePage.route,
        page: () => HomePage(),
      )
    ];
  }
}
