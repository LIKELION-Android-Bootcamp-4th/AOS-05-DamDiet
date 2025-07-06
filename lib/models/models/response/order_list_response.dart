import 'package:damdiet/models/models/order/order.dart';

class OrderListResponse {
  final List<Order> items;

  OrderListResponse({
    required this.items,
  });

  factory OrderListResponse.fromJson(Map<String, dynamic> json) {
    return OrderListResponse(
      items: (json['items'] as List)
          .map((e) => Order.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}
