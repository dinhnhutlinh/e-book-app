import 'package:injectable/injectable.dart';

@lazySingleton
class Validator {
  String? isNotNull(String fieldName, dynamic o) {
    if (o == null) {
      return '$fieldName không thể rỗng';
    } else {
      return null;
    }
  }

  String? isNotNullAndEmpty(String fieldName, String? text) {
    if (text == null || text.isEmpty) {
      return '$fieldName không thể rỗng';
    } else {
      return null;
    }
  }

  String? isEmail(String fieldName, String? text) {
    String? error;

    error = isNotNullAndEmpty(fieldName, text);

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

  String? isIdNumber(String fieldName, String? text) {
    String? error;

    error = isNotNullAndEmpty(fieldName, text);

    if (error == null) {
      final digitRegex = RegExp(r'^[0-9]*$');

      final isValidLength = text!.length == 8 || text.length == 12;
      final isMadeOfDigit = digitRegex.hasMatch(text);

      if (!isValidLength || !isMadeOfDigit) {
        return '$fieldName không hợp lệ';
      }
    }

    return error;
  }

  String? isNumber(String fieldName, String? text) {
    String? error;

    error = isNotNullAndEmpty(fieldName, text);
    if (error == null) {
      final digitRegex = RegExp(r'^[0-9]*$');

      final isValidNumber =
          int.tryParse(text!) != null && int.parse(text) <= 20;
      final isMadeOfDigit = digitRegex.hasMatch(text);

      if (!isValidNumber || !isMadeOfDigit) {
        return '$fieldName không hợp lệ';
      }
    }

    return error;
  }

  String? isNullOrEmail(String fieldName, String? text) {
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

  String? checkPassword(String fieldName, String? text) {
    String? error;

    error = isNotNullAndEmpty(fieldName, text);

    if (error == null) {
      if (text!.length < 8) {
        return 'Mật khẩu tối thiểu 8 ký tự';
      }
    }

    return error;
  }

  String? isPhone(String fieldName, String? text) {
    String? error;

    error = isNotNullAndEmpty(fieldName, text);

    if (error == null) {}

    return error;
  }

  String? isNullOrPhone(String fieldName, String? text) {
    String? error;

    if (text != null && text.isNotEmpty) {
      if (text.length > 13) {
        return '$fieldName không hợp lệ';
      }
      if (error == null) {}
    }

    return error;
  }
}
