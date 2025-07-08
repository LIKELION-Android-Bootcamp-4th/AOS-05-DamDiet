import 'package:damdiet/data/models/kcal/nut_api_item.dart';
import 'package:damdiet/data/repositories/nutrition_repository.dart';
import 'package:flutter/material.dart';

class KcalCalculatorViewmodel extends ChangeNotifier {
  final NutritionRepository _repository;

  KcalCalculatorViewmodel(this._repository);

  final List<String> _selectedFoodList = [];
  final List<int> _selectedCalList = [];
  List<NutApiItem> _searchedFoodList = [];
  int _selectedCalSum = 0;

  List<String> get selectedFoodList => _selectedFoodList;
  List<int> get selectedCalList => _selectedCalList;
  List<NutApiItem> get searchedFoodList => _searchedFoodList;
  int get selectedCalSum => _selectedCalSum;


  searchFood(String foodName, String? company) async {
    _searchedFoodList = await _repository.searchNutrition(foodName, company);
    print(_searchedFoodList.length);
    notifyListeners();
  }

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