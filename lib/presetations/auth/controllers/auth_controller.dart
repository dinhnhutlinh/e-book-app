import 'package:e_book_app/common_widget/stateless/app_alert_dialog.dart';
import 'package:e_book_app/data/models/user_profile.dart';
import 'package:e_book_app/data/repositories/auth_repository.dart';
import 'package:e_book_app/data/repositories/user_repository.dart';
import 'package:e_book_app/injection.dart';
import 'package:e_book_app/presetations/home/pages/home_page.dart';
import 'package:e_book_app/utils/exception.dart';
import 'package:e_book_app/utils/vadidator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final AuthRepository _authRepository = getIt<AuthRepository>();
  final UserRepository _userRepository = getIt<UserRepository>();
  User? _user;

  @override
  void onInit() {
    _user = _authRepository.getUser();
    super.onInit();
  }

  Future<void> signInWithGoogle() async {
    EasyLoading.show(status: 'Xin chờ');
    await _authRepository.signInWithGoogle().then((value) {
      _user = value;
      _userRepository.createUserProfileWithGoogle(UserProfile.fromUser(_user!));
      EasyLoading.dismiss();
      Get.offNamed(HomePage.route);
    }).onError((error, stackTrace) {
      EasyLoading.dismiss();
      AppAlertDialog.show(
        title: 'Lỗi',
        content: error.toString(),
      );
    });
  }

  String? _signInValidate(String email, String password) {
    String? mess;
    final validate = Validator();
    mess = validate.checkPassword('Mật khẩu', password);
    mess = validate.isEmail('Email', email);
    return mess;
  }

  signIn({required String email, required String password}) async {
    String? mess = _signInValidate(email, password);
    if (mess == null) {
      await EasyLoading.show(status: 'Xin chờ');
      await _authRepository
          .signIn(email: email, password: password)
          .then((value) async {
        _user = value;
        await EasyLoading.dismiss();
        Get.offNamed(HomePage.route);
      }).onError((error, stackTrace) async {
        await EasyLoading.dismiss();
        if (error is AuthException) {
          AppAlertDialog.show(title: 'Lỗi', content: error.toString());
        }
      });
    } else {
      AppAlertDialog.show(title: 'Lỗi', content: mess);
    }
  }

  void signUp(
      {required String email,
      required String password,
      required String rePassword}) async {
    String? mess = _signUpValidate(email, password, rePassword);
    if (mess == null) {
      EasyLoading.show(status: 'Xin chờ');
      await _authRepository
          .signUp(email: email, password: password)
          .then((value) {
        _user = value;
        _userRepository.createUserProfile(UserProfile.fromUser(value!));
        EasyLoading.dismiss();
        Get.offNamed(HomePage.route);
      }).onError(
        (error, stackTrace) {
          EasyLoading.dismiss();
          AppAlertDialog.show(
            title: 'Lỗi',
            content: (error is AuthException)
                ? error.toString()
                : 'Đăng ký không thành công',
          );
        },
      );
    } else {
      AppAlertDialog.show(
        title: 'Lỗi',
        content: mess,
      );
    }
  }

  String? _signUpValidate(String email, String password, String rePassword) {
    String? mess;
    final validate = Validator();
    mess = validate.checkPassword('Mật khẩu', password);
    mess = validate.isEmail('Email', email);
    if (password != rePassword) {
      return 'Mật khẩu không khớp';
    }
    return mess;
  }

  User get user => _user!;
  bool get isLogin => _user != null;
}
