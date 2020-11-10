import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ChangePasswordProvider with ChangeNotifier {
  final formKey = GlobalKey<FormState>();

  String _currentPassword;

  String _newPassword;
  String _newPasswordAgain;
  String _currentAddress;

  bool _autoValidate = false;
  bool _isLoading = false;
  bool _obscureText = false;

  String get currentPassword => _currentPassword;

  String get newPassword => _newPassword;

  String get newPasswordAgain => _newPasswordAgain;
  String get currentAddress => _currentAddress;

  bool get autoValidate => _autoValidate;

  bool get isLoading => _isLoading;

  bool get obscureText => _obscureText;

  set autoValidate(bool value) {
    _autoValidate = value;
    notifyListeners();
  }

  set obscureText(bool value) {
    _obscureText = value;
    notifyListeners();
  }

  void onSavedCurrentPassword(String currentPassword) {
    _currentPassword = currentPassword;
    notifyListeners();
  }void onSavedAddress(String currentAddress) {
    _currentAddress = currentAddress;
    notifyListeners();
  }

  void onSavedNewPassword(String newPassword) {
    _newPassword = newPassword;
    notifyListeners();
  }

  void onSavedNewPasswordAgain(String newPasswordAgain) {
    _newPasswordAgain = newPasswordAgain;
    notifyListeners();
  }

  String validatePassword(String value) {
    if (value.length == 0) {
      return "Please fill your password";
    } else if (value.length < 6) {
      return "Password must be more than 6 characters";
    } else {
      return null;
    }
  }String validateAddress(String value) {
    if (value.length == 0) {
      return "Please fill your address";
    } else if (value.length < 6) {
      return "Address must be more than 6 characters";
    } else {
      return null;
    }
  }

  String validatePasswordAgain(String value) {
    if (value.length == 0) {
      return "Please fill your password";
    } else if (value != _newPassword) {
      return "Password does not match";
    } else {
      return null;
    }
  }
}
