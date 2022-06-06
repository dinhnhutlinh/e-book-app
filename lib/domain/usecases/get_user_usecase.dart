import 'package:e_book_app/data/repositories/user_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetUserUserCase {
  final UserRepository _repository;

  GetUserUserCase(this._repository);

  User? execute() => _repository.getUser();
}
