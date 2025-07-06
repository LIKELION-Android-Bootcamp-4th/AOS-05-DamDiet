import 'package:flutter/widgets.dart';
import '../../../data/models/product/product.dart';
import '../../../data/repositories/product_repository.dart';

class HomeViewmodel extends ChangeNotifier {
  final ProductRepository _repository;

  HomeViewmodel(this._repository);

  List<Product> _products = [];
  List<Product> get products => _products;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> getProducts() async {
    _isLoading = true;
    notifyListeners();

    try {
      _products = await _repository.getProducts();
    } catch (e) {
      print('Error: $e');
    }

    _isLoading = false;
    notifyListeners();
  }
}
