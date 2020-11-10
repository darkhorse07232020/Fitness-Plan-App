import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/service_model.dart';
import 'theme_providers.dart';

class FilterProvider with ChangeNotifier {
  String _searchDate;
  DateTime _selectedDate;
  double _ratingValue = 0.0;
  double _distanceValue = 0.0;
  int _genderId;

  String get searchDate => _searchDate;
  double get ratingValue => _ratingValue;
  double get distanceValue => _distanceValue;
  int get genderId => _genderId;

  Future<void> showDateAndFilterSearch(BuildContext context,
      {ThemeProvider themeProv}) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2021),
    );
    if (picked != null && picked != _selectedDate) {
      _searchDate = DateFormat.yMd().format(picked);
      notifyListeners();
    }
  }

  void servicePicked({ServiceModel service}) {
    allServiceList.forEach((element) => element.isSelected = false);
    service.isSelected = true;
    notifyListeners();
  }

  void ratingOnChange(double value) {
    _ratingValue = value;
    notifyListeners();
  }

  void genderOnChange(int value) {
    _genderId = value;
    notifyListeners();
  }

  void distanceOnChangeEnd(double value) {
    _distanceValue = value;
    notifyListeners();
  }

  void distanceOnChangeStart(double value) {
    _distanceValue = value;
    notifyListeners();
  }

  void distanceOnChange(double value) {
    _distanceValue = value;
    notifyListeners();
  }

  void sortByPicked({SortByModel sortBy}) {
    sortByList.forEach((element) => element.isSelected = false);
    sortBy.isSelected = true;
    notifyListeners();
  }
}

class RadioGroup {
  final int index;
  final String label;

  RadioGroup({this.index, this.label});
}

class SortByModel {
  final String label;
  bool isSelected;

  SortByModel({this.label, this.isSelected});
}

final List<RadioGroup> genderList = [
  RadioGroup(index: 1, label: 'Man'),
  RadioGroup(index: 2, label: 'Woman'),
  RadioGroup(index: 3, label: 'Other'),
];

final List<SortByModel> sortByList = [
  SortByModel(
    label: 'Most Popular',
    isSelected: false,
  ),
  SortByModel(
    label: 'Cost Low to High',
    isSelected: false,
  ),
  SortByModel(
    label: 'Cost Hight to Low',
    isSelected: false,
  ),
];
