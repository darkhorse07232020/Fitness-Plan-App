import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

enum PaymentMethod { Visa, Bank, PayPal, COD }

class BookAppointmentProvider with ChangeNotifier {
  PaymentMethod _paymentPicked = PaymentMethod.Visa;
  String _selectedPaymentMethod;
  String _cardNameStr = 'VISA';
  String _selectedHairstyle;
  String _selectedShaving;
  String _selectedStyling;
  String _selectedFacial;
  String _selectedHaircolor;
  String _selectedTrimming;
  String _selectedHaircut;
  String _selectedHairDryer;
  String _selectedColoring;
  String _selectedMakeup;
  String _selectedEyeMakeup;
  String _selectedMonth;
  String _selectedYear;
  String _dateOfBirthStr;
  String _dateOfBooking;
  String _dateTomorrow;
  bool _selectedSlot = true;
  DateTime _selectedDate;

  String get selectedPaymentMethod => _selectedPaymentMethod;
  PaymentMethod get paymentPicked => _paymentPicked;
  String get selectedHairstyle => _selectedHairstyle;
  String get cardNameStr => _cardNameStr;

  String get selectedShaving => _selectedShaving;

  String get selectedStyling => _selectedStyling;

  String get selectedFacial => _selectedFacial;

  String get selectedHaircolor => _selectedHaircolor;

  String get selectedTrimming => _selectedTrimming;

  String get selectedHaircut => _selectedHaircut;

  String get selectedHairDryer => _selectedHairDryer;

  String get selectedColoring => _selectedColoring;

  String get selectedMakeup => _selectedMakeup;

  String get selectedEyeMakeup => _selectedEyeMakeup;
  String get selectedMonth => _selectedMonth;
  String get selectedYear => _selectedYear;

  String get dateOfBirthStr => _dateOfBirthStr;
  String get dateOfBooking => _dateOfBooking;
  String get dateTomorrow => _dateTomorrow;

  bool get selectedSlot => _selectedSlot;

  DateTime get selectedDate => _selectedDate;

  set selectedPaymentMethod(String item) {
    _selectedPaymentMethod = item;
    notifyListeners();
  }
  set cardNameStr(String item) {
    _cardNameStr = item;
    notifyListeners();
  }

  set paymentPicked(PaymentMethod item) {
    _paymentPicked = item;

    if(_paymentPicked == PaymentMethod.Visa){
      String _str = "VISA";
      cardNameStr = _str;
    }
    if(_paymentPicked == PaymentMethod.Bank){
      String _str = "Bank Account";
      cardNameStr = _str;
    }
    if(_paymentPicked == PaymentMethod.COD){
      String _str = "Cash On Delivery";
      cardNameStr = _str;
    }
    if(_paymentPicked == PaymentMethod.PayPal){
      String _str = "PayPal";
      cardNameStr = _str;
    }

    notifyListeners();
  }

  set selectedHairstyle(String item) {
    _selectedHairstyle = item;
    notifyListeners();
  }

  set selectedShaving(String item) {
    _selectedShaving = item;
    notifyListeners();
  }

  set selectedStyling(String item) {
    _selectedStyling = item;
    notifyListeners();
  }

  set selectedFacial(String item) {
    _selectedFacial = item;
    notifyListeners();
  }

  set selectedHaircolor(String item) {
    _selectedHaircolor = item;
    notifyListeners();
  }

  set selectedTrimming(String item) {
    _selectedTrimming = item;
    notifyListeners();
  }

  set selectedHaircut(String item) {
    _selectedHaircut = item;
    notifyListeners();
  }

  set selectedHairDryer(String item) {
    _selectedHairDryer = item;
    notifyListeners();
  }

  set selectedColoring(String item) {
    _selectedColoring = item;
    notifyListeners();
  }

  set selectedMakeup(String item) {
    _selectedMakeup = item;
    notifyListeners();
  }

  set selectedEyeMakeup(String item) {
    _selectedEyeMakeup = item;
    notifyListeners();
  }

  set selectedMonth(String item) {
    _selectedMonth = item;
    notifyListeners();
  }

  set selectedYear(String item) {
    _selectedYear = item;
    notifyListeners();
  }

  set selectedSlot(bool item) {
    _selectedSlot = item;
    notifyListeners();
  }

  UnmodifiableListView<String> get hairstyleItems {
    return UnmodifiableListView(this._hairstyleItems);
  }

  UnmodifiableListView<String> get shavingItems {
    return UnmodifiableListView(this._shavingItems);
  }

  UnmodifiableListView<String> get stylingItems {
    return UnmodifiableListView(this._stylingItems);
  }

  UnmodifiableListView<String> get facialItems {
    return UnmodifiableListView(this._facialItems);
  }

  UnmodifiableListView<String> get haircolorItems {
    return UnmodifiableListView(this._haircolorItems);
  }

  UnmodifiableListView<String> get trimmingItems {
    return UnmodifiableListView(this._trimmingItems);
  }

  UnmodifiableListView<String> get haircutItems {
    return UnmodifiableListView(this._haircutItems);
  }

  UnmodifiableListView<String> get hairDryerItems {
    return UnmodifiableListView(this._hairDryerItems);
  }

  UnmodifiableListView<String> get coloringItems {
    return UnmodifiableListView(this._coloringItems);
  }

  UnmodifiableListView<String> get makeupItems {
    return UnmodifiableListView(this._makeupItems);
  }

  UnmodifiableListView<String> get eyeMakeupItems {
    return UnmodifiableListView(this._eyeMakeupItems);
  }

  UnmodifiableListView<String> get monthItems {
    return UnmodifiableListView(this._monthItems);
  }

  UnmodifiableListView<String> get yearItems {
    return UnmodifiableListView(this._yearItems);
  }

  final List<String> _hairstyleItems = <String>[
    "Afro",
    "Bangs",
    "Beehive",
    "bob",
    "braid",
    "flattop",
  ];
  final List<String> _shavingItems = <String>[
    "Shaving1",
    "Shaving2",
    "Shaving3",
    "Shaving4",
    "Shaving5",
  ];
  final List<String> _stylingItems = <String>[
    "style1",
    "style2",
    "style3",
    "style4",
    "style5",
  ];
  final List<String> _facialItems = <String>[
    "facial1",
    "facial2",
    "facial3",
    "facial4",
    "facial5",
  ];
  final List<String> _haircolorItems = <String>[
    "Pink",
    "Green",
    "Black",
    "Brown",
    "Blue",
    "Rainbow",
  ];
  final List<String> _trimmingItems = <String>[
    "Trim 1",
    "Trim 2",
    "Trim 3",
    "Trim 4",
    "Trim 5",
  ];
  final List<String> _haircutItems = <String>[
    "Haircut 1",
    "Haircut 2",
    "Haircut 3",
    "Haircut 4",
    "Haircut 5",
  ];
  final List<String> _hairDryerItems = <String>[
    "Hairdyer 1",
    "Hairdyer 2",
    "Hairdyer 3",
    "Hairdyer 4",
    "Hairdyer 5",
  ];
  final List<String> _coloringItems = <String>[
    "Coloring 1",
    "Coloring 2",
    "Coloring 3",
    "Coloring 4",
    "Coloring 5",
  ];
  final List<String> _makeupItems = <String>[
    "Makeup 1",
    "Makeup 2",
    "Makeup 3",
    "Makeup 4",
    "Makeup 5",
  ];
  final List<String> _eyeMakeupItems = <String>[
    "Eye make up 1",
    "Eye make up 2",
    "Eye make up 3",
    "Eye make up 4",
    "Eye make up 5",
  ];
  final List<String> _monthItems = <String>[
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
    "10",
    "11",
    "12",
  ];
  final List<String> _yearItems = <String>[
    "20",
    "21",
    "22",
    "23",
    "24",
    "25",
  ];

  Future<void> selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != _selectedDate) {
      _dateOfBirthStr = DateFormat('yyyy-MM-dd').format(picked);
      print(_dateOfBirthStr);
      notifyListeners();
    }
  }

  Future<void> selectBookingDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != _selectedDate) {
      _dateOfBooking = DateFormat.yMMMMEEEEd().format(picked);
      print(_dateOfBooking);
      var tomorrow = DateTime(picked.year, picked.month, picked.day + 1);
      _dateTomorrow = DateFormat.yMMMMEEEEd().format(tomorrow);
      notifyListeners();
    }
  }
}
