import 'package:damdiet/data/datasource/payment_service.dart';

class PaymentRepository {
  final PaymentService _paymentService;

  PaymentRepository(this._paymentService);

  Future<bool> postOrder({
    required List orders,
    required String recipient,
    required String address,
    required String phone,
    required String payment,
  }) async {
    final response = await _paymentService.postOrder(
      orders,
      recipient,
      address,
      phone,
      payment
    );
    if (response.statusCode != 201) {
      throw Exception(response.statusMessage);
    } else {
      return true;
    }
  }

  Future<bool> postCartCheckout({
    required List cartIds,
    required String recipient,
    required String address,
    required String phone,
    required String payment,
  }) async {
    final response = await _paymentService.postCartCheckout(
      cartIds,
      recipient,
      address,
      phone,
      payment
    );
    if (response.statusCode != 201) {
      throw Exception(response.statusMessage);
    } else {
      return true;
    }
  }
}
