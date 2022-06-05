import 'package:e_book_app/data/datasources/auth_datasource.dart';
import 'package:e_book_app/domain/repositories/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepositoryImp extends AuthRepository {
  final AuthDataSource _dataSource;

  AuthRepositoryImp(this._dataSource);

  @override
  bool isSignIn() => _dataSource.isLogin();

  @override
  Future<User?> signIn({required String email, required String password}) =>
      _dataSource.signIn(email: email, password: password);

  @override
  Future<User?> signUp({required String email, required String password}) =>
      _dataSource.signUp(email: email, password: password);

  @override
  void signOut() => _dataSource.signOut();
  
  @override
  Future<User?> signInWithGoogle() => _dataSource.signInWithGoogle();
}
