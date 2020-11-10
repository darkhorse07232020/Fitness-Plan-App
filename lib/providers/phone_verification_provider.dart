import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_pickers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../helpers/toast.dart';
import '../screens/bottom_nav_bar_page.dart';
import '../screens/phone_verification_otp_page.dart';

class PhoneVerificationProvider with ChangeNotifier {
  String _countryCode = '1';
  String _phoneNumber = '';
  String _verificationCode = '';
  TextEditingController _phoneCtrl = TextEditingController();
  TextEditingController _codeCtrl = TextEditingController();
  Country _selectedDialogCountry =
      CountryPickerUtils.getCountryByPhoneCode('1');
  Country get selectedDialogCountry => _selectedDialogCountry;
  String get countryCode => _countryCode;
  String get phoneNumber => _phoneNumber;
  String get verificationCode => _verificationCode;
  TextEditingController get phoneCtrl => _phoneCtrl;
  TextEditingController get codeCtrl => _codeCtrl;

  void onSavedPhoneNumber(String value) {
    _phoneNumber = value;
    notifyListeners();
  }

  void clear() {
    _phoneNumber = '';
    _phoneCtrl.clear();
    notifyListeners();
  }

  void navigateToOTPScreen() {
    // if user doesn't fill phone number correctly
    // will appear toast message
    if (_phoneNumber == '') {
      toast('Please input your phone number');
    } else {
      // if user fill their phone number
      // will navigate to OTP Page
      Get.to(PhoneVerificationOTPPage());
    }
  }

  void navigateToHomePage() {
    // if user does'nt fill correct OTP Code
    // user will get toast message
    if (_codeCtrl.text == '') {
      return toast("Please fill your OTP code");
    } else if (_codeCtrl.text.length < 5) {
      return toast("Please fill your OTP code");
    } else {
      // if user already fill OTP code will
      // navigate to HomePage
      Get.to(BottomNavigationBarPage());
      toast("Home page");
    }
  }

  void validatePassword(String value) {}

  void onSavedCode(String code) {
    _verificationCode = code;
    notifyListeners();
  }

  void openCountryPickerDialog(BuildContext context) => showDialog(
        context: context,
        builder: (context) => Theme(
          data: Theme.of(context).copyWith(primaryColor: Colors.pink),
          child: CountryPickerDialog(
            titlePadding: EdgeInsets.all(8.0),
            searchCursorColor: Colors.pinkAccent,
            searchInputDecoration: InputDecoration(hintText: 'Search...'),
            isSearchable: true,
            title: Text('Select your phone code'),
            onValuePicked: (Country country) {
              _selectedDialogCountry = country;
              _countryCode = country.phoneCode;
              notifyListeners();
            },
            priorityList: [
              CountryPickerUtils.getCountryByIsoCode('TR'),
              CountryPickerUtils.getCountryByIsoCode('US'),
            ],
            itemBuilder: (country) {
              return countryAndCode(context, country: country);
            },
          ),
        ),
      );

  Widget countryAndCode(BuildContext context, {Country country}) {
    return Row(
      children: <Widget>[
        CountryPickerUtils.getDefaultFlagImage(country),
        SizedBox(width: 8.0),
        Text("+${country.phoneCode}"),
      ],
    );
  }
}
