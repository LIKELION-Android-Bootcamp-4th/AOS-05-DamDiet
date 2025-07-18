import 'cart_item.dart';

class Cart {
  final List<CartItem> items;
  final int totalItems;

  Cart({
    required this.items,
    required this.totalItems,
  });

  factory Cart.fromJson(Map<String, dynamic> json) {
    var itemsList = json['data']['items'] as List;
    List<CartItem> cartItems = itemsList.map((i) => CartItem.fromJson(i)).toList();

    return Cart(
      items: cartItems,
      totalItems: json['data']['pagination']['total'],
    );
  }
}