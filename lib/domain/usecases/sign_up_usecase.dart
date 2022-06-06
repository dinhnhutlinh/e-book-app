import 'package:e_book_app/data/repositories/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

@injectable
class SignUpUsecase {
  final AuthRepository _authRepository;

  SignUpUsecase(this._authRepository);

  Future<User?> execute({required String email, required String password}) =>
      _authRepository.signUp(email: email, password: password);
}
