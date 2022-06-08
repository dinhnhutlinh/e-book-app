import 'package:e_book_app/data/datasources/auth_datasource.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class AuthRepository {
  final AuthDataSource _dataSource;

  AuthRepository(this._dataSource);

  Future<User?> signIn({required String email, required String password}) =>
      _dataSource.signIn(email: email, password: password);

  Future<User?> signUp({required String email, required String password}) =>
      _dataSource.signUp(email: email, password: password);

  void signOut() => _dataSource.signOut();

  Future<User?> signInWithGoogle() => _dataSource.signInWithGoogle();

  User? getUser() => _dataSource.getUser();
}
