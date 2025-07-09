import 'package:flutter/material.dart';

class PriceRangeProvider extends ChangeNotifier {

  RangeValues _rangeValues = RangeValues(5000, 10000);

  RangeValues get rangeValues => _rangeValues;

  void changeRangeValues(RangeValues rangeValues) {
    _rangeValues = rangeValues;
    notifyListeners();
  }

}