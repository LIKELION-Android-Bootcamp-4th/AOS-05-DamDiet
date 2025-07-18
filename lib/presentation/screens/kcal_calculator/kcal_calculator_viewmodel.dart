import 'package:damdiet/data/models/kcal/product_nutrition.dart';
import 'package:damdiet/data/repositories/nutrition_repository.dart';
import 'package:flutter/material.dart';

class KcalCalculatorViewmodel extends ChangeNotifier {
  final NutritionRepository _repository;

  KcalCalculatorViewmodel(this._repository);

  final List<String> _selectedFoodList = [];
  final List<List<int>> _selectedCalList = []; // calorie : num
  List<ProductNutrition> _searchedFoodList = [];
  int _selectedCalSum = 0;
  bool _isSearching = false;

  List<String> get selectedFoodList => _selectedFoodList;
  List<List<int>> get selectedCalList => _selectedCalList;
  List<ProductNutrition> get searchedFoodList => _searchedFoodList;
  int get selectedCalSum => _selectedCalSum;
  bool get isSearching => _isSearching;

  searchFood(String foodName, String? company) async {
    _isSearching = true;
    notifyListeners();

    _searchedFoodList = await _repository.searchNutrition(foodName, company);
    _isSearching = false;
    notifyListeners();
  }

  addCalorie(String food, int cal) {
    if(_selectedFoodList.contains(food)) {
      int index = _selectedFoodList.indexWhere((e) => e == food);
      _selectedCalList[index][1] += 1;
    }
    else {
      _selectedFoodList.add(food);
      _selectedCalList.add([cal, 1]);
    }
    _selectedCalSum += cal;

    notifyListeners();
  }

  deleteCalorie(int index) {
    _selectedFoodList.removeAt(index);
    _selectedCalSum -= (_selectedCalList[index][0] * _selectedCalList[index][1]);
    _selectedCalList.removeAt(index);

    notifyListeners();
  }
}