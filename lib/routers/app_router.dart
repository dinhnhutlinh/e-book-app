import 'package:e_book_app/presetations/auth/controllers/auth_binding.dart';
import 'package:e_book_app/presetations/auth/pages/sign_in_page.dart';
import 'package:get/get.dart';

class Routes {
  static List<GetPage> router() {
    return <GetPage>[
      GetPage(
        name: SignInPage.route,
        page: () => SignInPage(),
        binding: AuthBinding(),
      ),
    ];
  }
}
