class AuthException implements Exception {
  final String error;

  AuthException(this.error);

  @override
  String toString() => error;

  String get mess => error;
}

class UserException implements Exception {
  final String error;

  UserException(this.error);
}

class DataException implements Exception {
  final String error;

  DataException(this.error);

  String get mess => error;
}
