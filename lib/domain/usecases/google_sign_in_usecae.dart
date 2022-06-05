import 'package:e_book_app/domain/repositories/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignInWithGoogleUseCase {
  final AuthRepository _authRepository;

  SignInWithGoogleUseCase(this._authRepository);

  Future<User?> execute() => _authRepository.signInWithGoogle();
}
