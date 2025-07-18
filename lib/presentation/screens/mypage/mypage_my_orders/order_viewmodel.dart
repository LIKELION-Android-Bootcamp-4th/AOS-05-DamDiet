import 'package:flutter/material.dart';
import 'package:damdiet/data/repositories/order_repository.dart';

import '../../../../data/models/order/my_order_item.dart';

class OrderViewModel with ChangeNotifier {
  final OrderRepository _repository;

  OrderViewModel(this._repository);

  List<MyOrderItem> _orders = [];
  List<MyOrderItem> get orders => _orders;

  bool _isLoading = false;
  bool get isLoading => _isLoading;


  Future<void> getOrders() async {
    _isLoading = true;
    notifyListeners();

    try {
      _orders = await _repository.getOrders();
    } catch (e) {
      print('주문 목록 불러오기 실패: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

}
