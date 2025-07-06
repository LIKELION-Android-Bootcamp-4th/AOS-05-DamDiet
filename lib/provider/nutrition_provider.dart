import 'package:flutter/material.dart';

class NutritionProvider extends ChangeNotifier {
  final List<String> _selectedFoodList = [];
  final List<int> _selectedCalList = [];
  int _selectedCalSum = 0;

  List<String> get selectedFoodList => _selectedFoodList;
  List<int> get selectedCalList => _selectedCalList;
  int get selectedCalSum => _selectedCalSum;

  addCalorie(String food, int cal) {
    _selectedFoodList.add(food);
    _selectedCalList.add(cal);
    _selectedCalSum += cal;

    notifyListeners();
  }

  deleteCalorie(int index) {
    _selectedFoodList.removeAt(index);
    _selectedCalSum -= _selectedCalList[index];
    _selectedCalList.removeAt(index);

    notifyListeners();
  }

}