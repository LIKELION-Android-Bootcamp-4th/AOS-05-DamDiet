import 'package:damdiet/data/models/cart/discount.dart';
import 'package:damdiet/data/models/product/product.dart';
import 'package:flutter/material.dart';

import '../../../core/exceptions/quantity_invalid_exception.dart';
import '../../../data/models/cart/cart_request.dart';
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
  );
  Product get product => _product;

  bool _isLoading = true;
  bool get isLoading => _isLoading;

  int _quantity = 1;
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

  Future<String> toggleFavorite() async {
    try {
      final isNowFavorite = await _repository.toggleFavorite(id: _product.id);

      _product = _product.copyWith(isFavorite: isNowFavorite);
      notifyListeners();

      return isNowFavorite ? '찜한 상품에 추가되었습니다!' : '찜이 해제되었습니다!';

    } catch (e) {
      debugPrint('즐겨찾기 변경 실패: $e');
      return '찜 처리 실패. 다시 시도해주세요.';
    }
  }



  Future<void> getProductDetail({required String id}) async {
    _isLoading = true;
    notifyListeners();

    try {
      _product = await _repository.getProductDetail(id: id);
      notifyListeners();

    } catch (e) {
      print('Error fetching product detail: $e');
    }

    _isLoading = false;
    notifyListeners();
  }

  Future<void> addToCart() async {
    if (_quantity <= 0) {
      throw QuantityInvalidException();
    }

    try {
      final discount = Discount(type: 'percent', value: _product.discount);

      await _repository.postCart(cartRequest: CartRequest(
        productId: _product.id,
        quantity: _quantity,
        unitPrice: _product.price,
        discount: discount,
      ));
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }

}