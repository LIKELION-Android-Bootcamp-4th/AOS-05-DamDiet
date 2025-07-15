import 'package:damdiet/data/models/cart/discount.dart';

class CartRequest {
  final String productId;
  final int quantity;
  final int unitPrice;
  final Discount discount;

  CartRequest({
    required this.productId,
    required this.quantity,
    required this.unitPrice,
    required this.discount,
  });


  Map<String, dynamic> toJson() {
    return {
      'productId': productId,
      'quantity': quantity,
      'unitPrice': unitPrice,
      'discount': discount.toJson(),
    };
  }
}
