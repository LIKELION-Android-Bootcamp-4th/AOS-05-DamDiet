import 'order_item.dart';
import 'shipping_info.dart';

class Order {
  final String id;
  final String orderNumber;
  final String status;
  final String statusText;
  final int totalAmount;
  final int shippingFee;
  final int finalAmount;
  final String paymentMethod;
  final String paymentStatus;
  final List<OrderItem> items;
  final ShippingInfo shippingInfo;
  final bool canReview;
  final DateTime createdAt;
  final DateTime updatedAt;

  Order({
    required this.id,
    required this.orderNumber,
    required this.status,
    required this.statusText,
    required this.totalAmount,
    required this.shippingFee,
    required this.finalAmount,
    required this.paymentMethod,
    required this.paymentStatus,
    required this.items,
    required this.shippingInfo,
    required this.canReview,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      id: json['_id'],
      orderNumber: json['orderNumber'],
      status: json['status'],
      statusText: json['statusText'],
      totalAmount: json['totalAmount'],
      shippingFee: json['shippingFee'],
      finalAmount: json['finalAmount'],
      paymentMethod: json['paymentMethod'],
      paymentStatus: json['paymentStatus'],
      items: (json['items'] as List)
          .map((e) => OrderItem.fromJson(e))
          .toList(),
      shippingInfo: ShippingInfo.fromJson(json['shippingInfo']),
      canReview: json['canReview'] ?? false,
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }
}