
import 'package:e_book_app/data/repositories/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

@injectable
class SignInUsecase {
  final AuthRepository _authRepository;

  SignInUsecase(this._authRepository);

  Future<User?> execute({required String email, required String password}) =>
      _authRepository.signIn(email: email, password: password);
}
