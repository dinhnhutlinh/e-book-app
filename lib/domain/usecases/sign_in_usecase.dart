
import 'package:e_book_app/domain/repositories/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignInUsecase {
  final AuthRepository _authRepository;

  SignInUsecase(this._authRepository);

  Future<User?> execute({required String email, required String password}) =>
      _authRepository.signIn(email: email, password: password);
}
