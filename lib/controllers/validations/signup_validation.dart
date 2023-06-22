import 'package:flutter/material.dart';
import 'package:p_five_ecommerce/controllers/validations/validation_model.dart';

class SignupValidation extends ChangeNotifier {
  late Validation _firstName = Validation(value: null, error: null);
  late Validation _lastName = Validation(value: null, error: null);
  late Validation _email = Validation(value: null, error: null);
  late Validation _password = Validation(value: null, error: null);

  Validation get firstName => _firstName;
  Validation get lastName => _lastName;
  Validation get email => _email;
  Validation get password => _password;

  void setFirstName(String value) {
    if (value.length >= 2) {
      _firstName = Validation(value: value, error: null);
    } else {
      _firstName =
          Validation(value: null, error: 'Must be at least 2 characters');
    }
    notifyListeners();
  }

  void setLastName(String value) {
    if (value.length >= 2) {
      _lastName = Validation(value: value, error: null);
    } else {
      _lastName =
          Validation(value: null, error: 'Must be at least 2 characters');
    }
    notifyListeners();
  }

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

  bool get isValidSignup {
    if (_firstName.value != null &&
        _lastName.value != null &&
        _password.value != null &&
        _email.value != null) {
      return true;
    } else {
      return false;
    }
  }
}
