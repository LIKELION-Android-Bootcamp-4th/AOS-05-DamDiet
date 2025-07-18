import 'cart_product.dart';

class CartItem {
  final String id;
  final CartProduct product;
  int quantity;
  final int totalPrice;
  final DateTime createdAt;

  CartItem({
    required this.id,
    required this.product,
    required this.quantity,
    required this.totalPrice,
    required this.createdAt,
  });

  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
      id: json['id'],
      product: CartProduct.fromJson(json['product']),
      quantity: json['quantity'],
      totalPrice: json['totalPrice'],
      createdAt: DateTime.parse(json['createdAt']),
    );

  }
}