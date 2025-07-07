import 'package:flutter/material.dart';

import '../../data/datasource/search_service.dart';

class SearchProvider extends ChangeNotifier {
  String _productName = "";
  int _selectedCategory = 0;

  String get productName => _productName;
  int get selectedCategory => _selectedCategory;

  void setProductName(String productName) {
    _productName = productName;
    notifyListeners();
  }

  void setCategory(int index) {
    _selectedCategory = index;
    notifyListeners();
  }

  void removeCategory() {
    _selectedCategory = 0;
    notifyListeners();
  }


  final SearchService _service = SearchService();

  Future<void> searchProducts() async {
    try {
      final response = await _service.searchProducts();

      switch(response.statusCode) {
        case 200:
          print('Success: ${response.data}');
          break;
        default:
          print('error occurred');
      }
    }
    catch(e) {
      debugPrint('$e');
    }
  }


}