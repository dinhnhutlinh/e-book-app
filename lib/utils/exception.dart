class AuthException implements Exception {
  final String error;

  AuthException(this.error);

  @override
  String toString() {
    // TODO: implement toString
    return error;
  }
}

class UserException implements Exception {
  final String error;

  UserException(this.error);
}
