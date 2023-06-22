import 'package:flutter/material.dart';
import 'package:p_five_ecommerce/controllers/validations/validation_model.dart';

class LoginValidation extends ChangeNotifier {
  late Validation _email = Validation(value: null, error: null);
  late Validation _password = Validation(value: null, error: null);

  Validation get email => _email;
  Validation get password => _password;

  void setEmail(String value) {
    RegExp regExp = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

    if (!regExp.hasMatch(value)) {
      _email = Validation(value: null, error: 'Not an email');
    } else {
      _email = Validation(value: value, error: null);
    }
    notifyListeners();
  }

  void setPassword(String value) {
    RegExp regExp =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
    if (value.length >= 8) {
      _password = Validation(value: value, error: null);
    } else if (!regExp.hasMatch(value)) {
      _password = Validation(value: null, error: 'Password must be strong');
    } else {
      _password = Validation(
          value: null, error: 'Password must be at least 8 characters');
    }
    notifyListeners();
  }

  bool get isValidLogin {
    if (_password.value != null && _email.value != null) {
      return true;
    } else {
      return false;
    }
  }
}
