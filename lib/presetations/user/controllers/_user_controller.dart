import 'package:e_book_app/data/models/user_profile.dart';
import 'package:e_book_app/data/repositories/user_repository.dart';
import 'package:e_book_app/injection.dart';
import 'package:e_book_app/presetations/auth/controllers/auth_controller.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  final _authController = Get.find<AuthController>();
  UserProfile? _profile;
  final _userRepository = getIt<UserRepository>();

  @override
  Future<void> onInit() async {
    String uid = _authController.user.uid;
    _profile = await _userRepository.getUserProfile(uid);
    super.onInit();
  }
}
