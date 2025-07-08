import 'package:flutter/widgets.dart';

import '../../../data/models/product/product.dart';
import '../../../data/repositories/search_repository.dart';

class SearchViewModel extends ChangeNotifier {
  final SearchRepository _repository;

  SearchViewModel(this._repository);

  String _productName = "";
  int? _selectedCategory;
  List<Product> _searchProductList = [];

  String get productName => _productName;
  int? get selectedCategory => _selectedCategory;
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
    _selectedCategory = null;
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