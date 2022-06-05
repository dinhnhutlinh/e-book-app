class Validator {
  static String? isNotNull(dynamic o) {
    if (o == null) {
      return 'không thể rỗng';
    } else {
      return null;
    }
  }

  static String? isNotNullAndEmpty(String? text) {
    if (text == null || text.isEmpty) {
      return 'không thể rỗng';
    } else {
      return null;
    }
  }

  static String? isEmail(String? text) {
    String? error;

    error = isNotNullAndEmpty(text);

    if (error == null) {
      final emailRegex = RegExp(
        r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?",
      );

      final emailToTest = text!.toLowerCase();

      if (!emailRegex.hasMatch(emailToTest)) {
        return 'Email không hợp lệ';
      }
    }
    return error;
  }

  static String? isIdNumber(String? text) {
    String? error;

    error = isNotNullAndEmpty(text);

    if (error == null) {
      final digitRegex = RegExp(r'^[0-9]*$');

      final isValidLength = text!.length == 8 || text.length == 12;
      final isMadeOfDigit = digitRegex.hasMatch(text);

      if (!isValidLength || !isMadeOfDigit) {
        return 'không hợp lệ';
      }
    }

    return error;
  }

  static String? isNumber(String? text) {
    String? error;

    error = isNotNullAndEmpty(text);
    if (error == null) {
      final digitRegex = RegExp(r'^[0-9]*$');

      final isValidNumber =
          int.tryParse(text!) != null && int.parse(text) <= 20;
      final isMadeOfDigit = digitRegex.hasMatch(text);

      if (!isValidNumber || !isMadeOfDigit) {
        return 'không hợp lệ';
      }
    }

    return error;
  }

  static String? isNullOrEmail(String? text) {
    if (text != null && text.isNotEmpty) {
      final emailRegex = RegExp(
        r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?",
      );

      if (!emailRegex.hasMatch(text)) {
        return 'Email không hợp lệ';
      }
    }
    return null;
  }

  static String? checkPassword(String? text) {
    String? error;

    error = isNotNullAndEmpty(text);

    if (error == null) {
      if (text!.length < 8) {
        return 'Mật khẩu tối thiểu 8 ký tự';
      }
    }

    return error;
  }

  static String? isPhone(String? text) {
    String? error;

    error = isNotNullAndEmpty(text);

    if (error == null) {}

    return error;
  }

  static String? isNullOrPhone(String? text) {
    String? error;

    if (text != null && text.isNotEmpty) {
      if (text.length > 13) {
        return 'không hợp lệ';
      }
      if (error == null) {}
    }

    return error;
  }
}
