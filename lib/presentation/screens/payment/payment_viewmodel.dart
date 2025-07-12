import 'package:damdiet/data/repositories/payment_repository.dart';
import 'package:flutter/material.dart';
import '../../../data/models/request/order_request_dto.dart';

class PaymentViewmodel extends ChangeNotifier {
  final PaymentRepository _repository;

  PaymentViewmodel(this._repository);

  Future<bool> doPayment({
    required List<OrderItem> orderItem,
    required String recipient,
    required String address,
    required String phone
  }) async {
    var items = [];
    for(int index = 0; index < orderItem.length; index++) {
      items.add({
        'product': orderItem[index].product,
        'quantity': orderItem[index].quantity,
        'unitPrice': orderItem[index].unitPrice
      });
    }
    var bool = await _repository.postOrder(
        orders: items,
        recipient: recipient,
        address: address,
        phone: phone);
    notifyListeners();
    return bool;
  }
}