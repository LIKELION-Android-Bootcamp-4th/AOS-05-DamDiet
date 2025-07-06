import 'package:flutter/material.dart';

class SearchProvider extends ChangeNotifier {
  String _productName = "";
  final List<String> _categories = [];

  String get productName => _productName;
  List<String> get categories => _categories;

  void setProductName(String productName) {
    _productName = productName;
    notifyListeners();
  }

  void addCategory(String category) {
    _categories.add(category);
    notifyListeners();
  }

  void removeCategory(String category) {
    _categories.remove(category);
    notifyListeners();
  }

}