import 'package:flutter/cupertino.dart';

class ForgotPasswordProvider with ChangeNotifier{
  String _email = '';
  TextEditingController _emailCtrl = TextEditingController();

  TextEditingController get emailCtrl => _emailCtrl;
  String get email => _email;

  void onSavedEmail(String value) {
    _email = value;
    notifyListeners();
  }
}