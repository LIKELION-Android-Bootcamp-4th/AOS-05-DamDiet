import 'cart_item.dart';

class Cart {
  final List<CartItem> items;
  final int totalItems;
  final int totalAmount;

  Cart({
    required this.items,
    required this.totalItems,
    required this.totalAmount,
  });

  factory Cart.fromJson(Map<String, dynamic> json) {
    var itemsList = json['data']['items'] as List;
    List<CartItem> cartItems = itemsList.map((i) => CartItem.fromJson(i)).toList();

    return Cart(
        items: cartItems,
        totalItems: json['data']['totalItems'],
        totalAmount: json['data']['totalAmount']);
  }
}