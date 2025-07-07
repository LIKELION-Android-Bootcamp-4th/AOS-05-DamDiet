import 'package:flutter/widgets.dart';
import '../../../data/models/product/product.dart';
import '../../../data/repositories/product_repository.dart';
class HomeViewmodel extends ChangeNotifier {
  final ProductRepository _repository;

  HomeViewmodel(this._repository);

  // 최신순 상품
  List<Product> _latestProducts = [];
  List<Product> get latestProducts => _latestProducts;

  // 인기순 상품
  List<Product> _popularProducts = [];
  List<Product> get popularProducts => _popularProducts;

  // 판매량 순 상품
  List<Product> _salesProducts = [];
  List<Product> get salesProducts => _salesProducts;

  // 로딩 상태
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> getHomeProducts() async {
    _isLoading = true;
    notifyListeners();

    try {
      _latestProducts = await _repository.getLatestProducts();
      _popularProducts = await _repository.getPopularProducts();
      _salesProducts = await _repository.getSalesProducts();
    } catch (e) {
      print('Error fetching products: $e');
    }

    _isLoading = false;
    notifyListeners();
  }
}
