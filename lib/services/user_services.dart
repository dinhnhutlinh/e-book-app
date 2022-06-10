import 'package:e_book_app/models/user_profile.dart';
import 'package:e_book_app/repositories/user_repository.dart';
import 'package:e_book_app/services/auth_service.dart';
import 'package:get/get.dart';

class UserService extends GetxService {
  final _auhtService = Get.find<AuthService>();
  UserProfile? _profile;
  final _userRepository = UserRepository();

  @override
  Future<void> onInit() async {
    String uid = _auhtService.user.uid;
    _profile = await _userRepository.getUserProfile(uid);

    super.onInit();
  }

  void logout() {
    _auhtService.signOut();
  }

  UserProfile? get profile => _profile;

  Future<UserProfile> getUserProfile(String uid) =>
      _userRepository.getUserProfile(uid);
}
