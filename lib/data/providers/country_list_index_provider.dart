import 'package:flutter/material.dart';

class CountryListIndexProvider with ChangeNotifier {
  int _indexOfCountryList = 0;

  int get countryIndex => _indexOfCountryList;

  void updateCountryIndex({required int val}) {
    _indexOfCountryList = val;
    notifyListeners();
  }
}
