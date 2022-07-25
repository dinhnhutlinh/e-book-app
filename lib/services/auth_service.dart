import 'package:e_book_app/utils/exception.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService extends GetxService {
  final _firebaseAuth = FirebaseAuth.instance;
  final _googleSignIn = GoogleSignIn();

  Future<User?> signIn(
      {required String email, required String password}) async {
    final userCredential = await _firebaseAuth
        .signInWithEmailAndPassword(email: email, password: password)
        .onError((error, stackTrace) {
      if (error is FirebaseAuthException) {
        if (error.code == 'user-disabled') {
          throw AuthException('Account disabled'.tr);
        } else if (error.code == 'user-not-found') {
          throw AuthException('User not found'.tr);
        } else if (error.code == 'invalid-email') {
          throw AuthException('Invalid email'.tr);
        }
      }
      throw AuthException('Can\'t connect'.tr);
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
          throw AuthException('Weak password'.tr);
        } else if (error.code == 'email-already-in-use') {
          throw AuthException('Email already in use'.tr);
        } else if (error.code == 'invalid-email') {
          throw AuthException('Invalid email'.tr);
        }
      }
      throw AuthException('Can\'t connect'.tr);
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
        (error, stackTrace) => throw AuthException('Invalid email'.tr));
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

  User? get user => _firebaseAuth.currentUser;
}
