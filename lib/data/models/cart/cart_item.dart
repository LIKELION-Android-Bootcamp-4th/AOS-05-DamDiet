import 'cart_product.dart';

class CartItem {
  final String id;
  final CartProduct product;
  final int quantity;
  final String? option;
  final int subtotal;
  final DateTime createdAt;

  CartItem({
    required this.id,
    required this.product,
    required this.quantity,
     this.option,
    required this.subtotal,
    required this.createdAt,
  });

  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
      id: json['id'],
      product: CartProduct.fromJson(json['product']),
      quantity: json['quantity'],
      option: json['options'] as String?,
      subtotal: json['subtotal'],
      createdAt: DateTime.parse(json['createdAt']),
    );
  }
}