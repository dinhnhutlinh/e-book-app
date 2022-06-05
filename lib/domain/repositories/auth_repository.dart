import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRepository {
  Future<User?> signIn({required String email, required String password});
  Future<User?> signUp({required String email, required String password});
  void signOut();
  bool isSignIn();

  Future<User?> signInWithGoogle();
}
