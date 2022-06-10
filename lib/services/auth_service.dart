import 'package:e_book_app/models/user_profile.dart';
import 'package:e_book_app/repositories/auth_repository.dart';
import 'package:e_book_app/repositories/user_repository.dart';
import 'package:e_book_app/utils/exception.dart';
import 'package:e_book_app/utils/vadidator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthService extends GetxService {
  final _authRepository = AuthRepository();
  final _userRepository = UserRepository();
  User? _user;

  @override
  void onInit() {
    _user = _authRepository.getUser();
    super.onInit();
  }

  String? _signInValidate(String email, String password) {
    String? mess;
    final validate = Validator();
    mess = validate.checkPassword('Mật khẩu', password);
    mess = validate.isEmail('Email', email);
    return mess;
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

  Future signIn({required String email, required String password}) async {
    String? mess = _signInValidate(email, password);
    if (mess == null) {
      await _authRepository
          .signIn(email: email, password: password)
          .then((value) async {
        _user = value;
        await _userRepository.updateLastSignIn(value?.uid ?? '');
      }).onError((error, stackTrace) async {
        if (error is AuthException) {
          throw AuthException(error.mess);
        }
      });
    } else {
      throw AuthException(mess);
    }
  }

  Future<void> signInWithGoogle() async {
    await _authRepository.signInWithGoogle().then((value) async {
      _user = value;

      await _userRepository
          .createUserProfileWithGoogle(UserProfile.fromUser(_user!));
    }).onError((error, stackTrace) {
      throw AuthException(error.toString());
    });
  }

  Future<void> signInWithFacebook() => _authRepository.signInWithFacebook();

  Future<void> signUp(
      {required String email,
      required String password,
      required String rePassword}) async {
    String? mess = _signUpValidate(email, password, rePassword);
    if (mess == null) {
      await _authRepository
          .signUp(email: email, password: password)
          .then((value) {
        _user = value;
        _userRepository.createUserProfile(UserProfile.fromUser(value!));
      }).onError(
        (error, stackTrace) {
          throw AuthException(error.toString());
        },
      );
    } else {
      throw AuthException(mess);
    }
  }

  void signOut() {
    _user = null;
    _authRepository.signOut();
  }

  User get user => _user!;
  bool get isLogin => _user != null;
}
