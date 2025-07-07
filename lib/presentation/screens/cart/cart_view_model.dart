import 'package:damdiet/data/models/cart/cart_item.dart';
import 'package:flutter/material.dart';
import 'package:damdiet/data/models/cart/cart.dart';
import 'package:damdiet/data/repositories/cart_repository.dart';



class CartViewModel with ChangeNotifier {
  final CartRepository _repository = CartRepository();

  Cart? _cart;
  final Set<String> _selectedItemIds = {};
  bool _isLoading = false;

  Cart? get cart => _cart;
  Set<String> get selectedItemIds => _selectedItemIds;
  bool get isLoading => _isLoading;

  bool isAllSelected() {
    if (_cart == null || _cart!.items.isEmpty) return false;
    return _selectedItemIds.length == _cart!.items.length;
  }

  Future<void> fetchCart() async {
    _isLoading = true;
    notifyListeners();
    try {
      _cart = await _repository.fetchCart();
      _selectedItemIds.clear();
      _cart?.items.forEach((item) => _selectedItemIds.add(item.id));
    } catch (e) {
      print(e);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void toggleAllSelection(bool isSelected) {
    _selectedItemIds.clear();
    if (isSelected && _cart != null) {
      for (var item in _cart!.items) {
        _selectedItemIds.add(item.id);
      }
    }
    notifyListeners();
  }

  void toggleItemSelection(String itemId) {
    if (_selectedItemIds.contains(itemId)) {
      _selectedItemIds.remove(itemId);
    } else {
      _selectedItemIds.add(itemId);
    }
    notifyListeners();
  }

  Future<void> updateQuantity(CartItem item, int newQuantity) async {
    await _repository.addToCart(productId: item.product.id, quantity: newQuantity);
    await fetchCart();
  }

  Future<void> deleteSelectedItems() async {
    if (_selectedItemIds.isEmpty) return;
    await _repository.removeItems(_selectedItemIds.toList());
    await fetchCart();
  }
}
