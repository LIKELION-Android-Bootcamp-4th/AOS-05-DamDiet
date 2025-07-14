import 'package:damdiet/data/repositories/payment_repository.dart';
import 'package:flutter/material.dart';
import '../../../data/models/request/order_request_dto.dart';

class PaymentViewmodel extends ChangeNotifier {
  final PaymentRepository _repository;

  PaymentViewmodel(this._repository);

  bool _isChecked = false;
  String? _selectedPayment;

  bool get isChecked => _isChecked;
  String? get selectedPayment => _selectedPayment;

  Future<bool> doPayment({
    required List<OrderItem> orderItem,
    required String recipient,
    required String address,
    required String phone,
    List? cartIds,
  }) async {
    var items = [];
    for(int index = 0; index < orderItem.length; index++) {
      items.add({
        'product': orderItem[index].product,
        'quantity': orderItem[index].quantity,
        'unitPrice': orderItem[index].unitPrice
      });
    }
    if(cartIds != null) {
      return await _repository.postCartCheckout(
        cartIds: cartIds,
        recipient: recipient,
        address: address,
        phone: phone,
        payment: _selectedPayment!
      );
    }
    else {
      return await _repository.postOrder(
        orders: items,
        recipient: recipient,
        address: address,
        phone: phone,
        payment: _selectedPayment!
      );
    }
  }


  clickCheckbox() {
    _isChecked = !_isChecked;
    notifyListeners();
  }

  changePayment(String? value) {
    _selectedPayment = value;
    notifyListeners();
  }
}