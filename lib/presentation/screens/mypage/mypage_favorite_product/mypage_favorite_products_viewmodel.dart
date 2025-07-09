import 'package:damdiet/data/models/favorite_product/favorite_product.dart';
import 'package:flutter/material.dart';
import 'package:damdiet/data/repositories/favorite_repository.dart';


class MyPageFavoriteProductsViewModel with ChangeNotifier {
  final FavoriteRepository _repository;
  MyPageFavoriteProductsViewModel(this._repository) {
    fetchFavorites();
  }

  List<FavoriteProduct> _favorites = [];
  bool _isLoading = false;

  List<FavoriteProduct> get favorites => _favorites;
  bool get isLoading => _isLoading;

  Future<void> fetchFavorites() async {
    _isLoading = true;
    notifyListeners();
    try {
      _favorites = await _repository.fetchFavoriteProducts();
    } catch (e) {
      print('찜 목록 불러오기 실패: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> unfavoriteProduct(String productId) async {
    try {
      final isNowFavorite = await _repository.toggleFavorite(productId: productId);

      if (!isNowFavorite) {
        _favorites.removeWhere((fav) => fav.product.id == productId);
        notifyListeners();
      }
    } catch (e) {
      debugPrint('찜 취소 실패: $e');
    }
  }
}