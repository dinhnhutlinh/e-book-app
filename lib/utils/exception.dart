class AuthException implements Exception {
  final String error;

  AuthException(this.error);
}

class UserException implements Exception {
  final String error;

  UserException(this.error);
}
