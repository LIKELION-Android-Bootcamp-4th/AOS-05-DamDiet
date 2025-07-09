import 'package:flutter/material.dart';

import '../../../data/models/product/product.dart';
import '../../../data/models/product/product_query.dart';
import '../../../data/repositories/product_repository.dart';

class ProductsViewModel extends ChangeNotifier {
  final ProductRepository _repository;

  ProductsViewModel(this._repository);


  ProductQuery _query = ProductQuery();
  ProductQuery get query => _query;

  List<Product> _products = [];
  List<Product> get products => _products;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> setInitialQuery(ProductQuery query) async {
    _query = query;
    getProducts();
  }

  void setSearch(String value) {
    _query = _query.copyWith(search: value.isEmpty ? null : value);
    notifyListeners();
  }

  Future<void> getProducts() async {

    _isLoading = true;
    notifyListeners();

    try {
       _products = await _repository.getProducts(query: _query);
    } catch (e) {
      debugPrint('Products get failed: $e');
      _products = [];
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void removeCategory() {
    _query = _query.copyWith(category: null);
    getProducts();
    notifyListeners();
  }

  void removeSearch() {
    _query = _query.copyWith(search: null);
    getProducts();
    notifyListeners();
  }

  void removePriceRange() {
    _query = _query.copyWith(minPrice: null, maxPrice: null);
    getProducts();
    notifyListeners();
  }
}
