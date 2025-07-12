import 'package:damdiet/data/datasource/payment_service.dart';

class PaymentRepository {
  final PaymentService _paymentService;
  PaymentRepository(this._paymentService);

  Future<bool> postOrder({
    required List orders,
    required String recipient,
    required String address,
    required String phone
}) async {
    final response = await _paymentService.postOrder(orders, recipient, address, phone);
    if(response.statusCode != 201) {
      throw Exception(response.statusMessage);
    }
    else {
      return true;
    }
  }
}