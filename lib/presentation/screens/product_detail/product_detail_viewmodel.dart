import 'package:damdiet/data/models/product/product.dart';
import 'package:flutter/material.dart';

import '../../../data/models/product/product_nutrition.dart';
import '../../../data/repositories/product_repository.dart';

class ProductDetailViewmodel extends ChangeNotifier {
  final ProductRepository _repository;

  ProductDetailViewmodel(this._repository);

  Product _product =  Product(
    id: '0',
    name: 'Dummy Product',
    image: 'https://via.placeholder.com/150',
    price: 0,
    isFavorite: false,
    discount: 0,
    category: null,
    rating: 0.0,
    attributes: ProductNutrition(
      calories: "",
      carbs: "",
      protein: "",
      fat: "",
    ),
    reviews: [],
    options: [],
  );
  Product get product => _product;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  int _quantity = 0;
  int get quantity => _quantity;

  void increaseQuantity() {
    _quantity++;
    notifyListeners();
  }

  void decreaseQuantity() {
    if (_quantity > 1) {
      _quantity--;
      notifyListeners();
    }
  }

  void setQuantity(int value) {
      _quantity = value;
      notifyListeners();
  }

  Future<void> getProductDetail({required String id}) async {
    _isLoading = true;
    notifyListeners();

    try {
      _product = await _repository.getProductDetail(id: id);
    } catch (e) {
      print('Error fetching product detail: $e');
    }

    _isLoading = false;
    notifyListeners();
  }

}