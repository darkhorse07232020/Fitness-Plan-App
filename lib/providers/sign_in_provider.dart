import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SignInProvider with ChangeNotifier {
  bool _obscureText = true;
  bool get obscureText => _obscureText;

  set obscureText(bool value) {
    _obscureText = value;
    notifyListeners();
  }

  void changeObscureText() {
    _obscureText = !_obscureText;
    notifyListeners();
  }
}
