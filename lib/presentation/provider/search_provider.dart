import 'package:damdiet/data/repositories/product_repository.dart';
import 'package:flutter/material.dart';

import '../../data/models/product/product.dart';
import '../../data/repositories/search_repository.dart';

class SearchProvider extends ChangeNotifier {
  final SearchRepository _repository;

  SearchProvider(this._repository);

  String _productName = "";
  int _selectedCategory = 0;
  List<Product> _searchProductList = [];

  String get productName => _productName;
  int get selectedCategory => _selectedCategory;
  List<Product> get searchProductList => _searchProductList;

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


  Future<void> searchProducts() async {
    try {
      _searchProductList= await _repository.getSearchedProducts(_productName);
      print(_searchProductList.first.image);
    }
    catch(e) {
      debugPrint('$e');
    }
  }


}