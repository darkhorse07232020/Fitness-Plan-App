import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../helpers/toast.dart';
import '../screens/phone_verification_page.dart';

class SignUpProvider with ChangeNotifier {
  String _dateOfBirth;
  String _selectedGender;
  DateTime _selectedDate;
  bool _isAccepted = false;
  bool _obscureText1 = true;
  bool _obscureText2 = true;

  // Gender DropDownButton Options
  final List<String> _genderItems = <String>[
    "Male",
    "Female",
  ];

  String get dateOfBirth => _dateOfBirth;
  String get selectedGender => _selectedGender;

  bool get isAccepted => _isAccepted;
  bool get obscureText1 => _obscureText1;
  bool get obscureText2 => _obscureText2;

  UnmodifiableListView<String> get genderItems {
    return UnmodifiableListView(this._genderItems);
  }

  set selectedGender(String item) {
    _selectedGender = item;
    notifyListeners();
  }

  void onSavedDateOfBirth(String dateOfBirth) {
    _dateOfBirth = dateOfBirth;
    notifyListeners();
  }

  void acceptTermsAndCondition() {
    _isAccepted = !_isAccepted;
    notifyListeners();
  }

  void hidePassword() {
    _obscureText1 = !_obscureText1;
    notifyListeners();
  }

  void hidePasswordAgain() {
    _obscureText2 = !_obscureText2;
    notifyListeners();
  }

  // [Sign Up] Button Function
  void signUpFunction() {
    /// if [Terms] and [Condition[ accepted
    /// Button will [Navigate] to Verification Page
    /// if not accepted toast will appear to user
    _isAccepted
        ? goToVerification()
        : toast('Please accept our Terms and Condition');
  }

  /// Function for [Navigation]
  void goToVerification() {
    Get.to(PhoneVerificationPage());
  }

  // show date dialog Flutter
  // when user pick date, will automatically
  // change to String by format
  Future<void> selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != _selectedDate) {
      _dateOfBirth = DateFormat('dd/MM/yyyy').format(picked);
      print(_dateOfBirth);
      notifyListeners();
    }
  }
}
