import '../cart/cart_item.dart';

class CartResponse {
  final List<CartItem> items;
  final int totalItems;
  final int totalAmount;

  CartResponse({
    required this.items,
    required this.totalItems,
    required this.totalAmount,
  });

  factory CartResponse.fromJson(Map<String, dynamic> json) {
    return CartResponse(
      items: (json['data']['items'] as List)
          .map((e) => CartItem.fromJson(e))
          .toList(),
      totalItems: json['data']['totalItems'],
      totalAmount: json['data']['totalAmount'],
    );
  }
}




