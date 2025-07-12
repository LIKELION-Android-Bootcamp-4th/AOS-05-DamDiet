import 'package:flutter/material.dart';

import '../../../../data/models/order/my_order_detail.dart';
import '../../../../data/repositories/order_repository.dart';

class OrderDetailViewModel extends ChangeNotifier {
  final OrderRepository _repository;

  OrderDetailViewModel(this._repository);

  MyOrderDetail? _orderDetail;
  MyOrderDetail? get orderDetail => _orderDetail;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;


  Future<void> getOrderDetail(String orderId) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final detail = await _repository.getOrderDetail(orderId);
      _orderDetail = detail;
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
