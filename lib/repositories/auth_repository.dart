import 'package:e_book_app/utils/exception.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthRepository {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<User?> signIn(
      {required String email, required String password}) async {
    final userCredential = await _firebaseAuth
        .signInWithEmailAndPassword(email: email, password: password)
        .onError((error, stackTrace) {
      if (error is FirebaseAuthException) {
        if (error.code == 'user-disabled') {
          throw AuthException('tài khoản đã bị khóa');
        } else if (error.code == 'user-not-found') {
          throw AuthException('Tài khoản không tồn tại');
        } else if (error.code == 'invalid-email') {
          throw AuthException('Email không tồn tại');
        }
      }
      throw AuthException('Không thể kết nối mạng');
    });
    return userCredential.user;
  }

  Future<User?> signUp(
      {required String email, required String password}) async {
    await _firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: password)
        .onError((error, stackTrace) {
      if (error is FirebaseAuthException) {
        if (error.code == 'weak-password') {
          throw AuthException('mật khẩu quá yếu');
        } else if (error.code == 'email-already-in-use') {
          throw AuthException('Email đã được sử dụng');
        } else if (error.code == 'invalid-email') {
          throw AuthException('Email không tồn tại');
        }
      }
      throw AuthException('Không thể kết nối');
    });
    return _firebaseAuth.currentUser;
  }

  isLogin() => _firebaseAuth.currentUser != null;

  void signOut() {
    _firebaseAuth.signOut();
    _googleSignIn.signOut();
  }

  Future<User?> signInWithGoogle() async {
    final googleUser = await _googleSignIn.signIn().onError(
        (error, stackTrace) => throw AuthException('Không thể kết nối'));
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    return (await _firebaseAuth.signInWithCredential(credential)).user;
  }

  Future<UserCredential> signInWithFacebook() async {
    // Trigger the sign-in flow
    final LoginResult loginResult = await FacebookAuth.instance.login();

    // Create a credential from the access token
    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken?.token ?? '');

    // Once signed in, return the UserCredential
    return _firebaseAuth.signInWithCredential(facebookAuthCredential);
  }

  User? getUser() => _firebaseAuth.currentUser;
}
