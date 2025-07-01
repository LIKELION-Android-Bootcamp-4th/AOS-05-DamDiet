import 'package:flutter/widgets.dart';

import '../models/Product.dart';
import '../service/product_api/product_api.dart';

class ProductProvider extends ChangeNotifier {
  final ProductService _service = ProductService();

  List<Product> _products = [];
  List<Product> get products => _products;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> getProducts() async {
    _isLoading = true;
    notifyListeners();

    try {
      _products = await _service.getProducts();
    } catch (e) {
      print('Error: $e');
    }

    _isLoading = false;
    notifyListeners();
  }
}
