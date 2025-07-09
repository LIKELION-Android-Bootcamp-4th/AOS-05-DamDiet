import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../data/models/product/product.dart';
import '../../../data/repositories/search_repository.dart';

class SearchViewModel extends ChangeNotifier {
  final SearchRepository _repository;

  SearchViewModel(this._repository);

  String _productName = "";
  String? _selectedCategory;
  List<Product> _searchProductList = [];
  RangeValues _rangeValues = const RangeValues(5000, 10000);


  String get productName => _productName;
  String? get selectedCategory => _selectedCategory;
  List<Product> get searchProductList => _searchProductList;
  RangeValues get rangeValues => _rangeValues;



  void setProductName(String productName) {
    _productName = productName;
    notifyListeners();
  }

  void setCategory(String category) {
    _selectedCategory = category;
    notifyListeners();
  }

  void removeCategory() {
    _selectedCategory = null;
    notifyListeners();
  }

  void changeRangeValues(RangeValues newRange) {
    _rangeValues = newRange;
    notifyListeners();
  }

  Future<void> searchProducts() async {
    try {
      _searchProductList = await _repository.getSearchedProducts(_productName);
      notifyListeners();
    }
    catch(e) {
      debugPrint('$e');
    }
  }
}