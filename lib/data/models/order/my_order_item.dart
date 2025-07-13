import 'package:damdiet/data/models/product/review_summary_product.dart';

class MyOrderItem {
  final int subtotalAmount;
  final int shippingCost;
  final int totalAmount;
  final String status;
  final String createdAt;
  final String orderNumber;
  final List<OrderProduct> items;
  final String id;

  MyOrderItem({
    required this.subtotalAmount,
    required this.shippingCost,
    required this.totalAmount,
    required this.status,
    required this.createdAt,
    required this.orderNumber,
    required this.items,
    required this.id,
  });

  factory MyOrderItem.fromJson(Map<String, dynamic> json) {
    return MyOrderItem(
      subtotalAmount: json['subtotalAmount'],
      shippingCost: json['shippingCost'],
      totalAmount: json['totalAmount'],
      status: json['status'],
      createdAt: json['createdAt'],
      orderNumber: json['orderNumber'],
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => OrderProduct.fromJson(e))
          .toList() ?? [],
      id: json['id'],
    );
  }
}

class OrderProduct {
  final String id;
  final String name;
  final int quantity;
  final int unitPrice;
  final int totalPrice;
  final String thumbnailImageUrl;

  OrderProduct({
    required this.id,
    required this.name,
    required this.quantity,
    required this.unitPrice,
    required this.totalPrice,
    required this.thumbnailImageUrl,
  });

  factory OrderProduct.fromJson(Map<String, dynamic> json) {
    return OrderProduct(
      id: json['id'] as String,
      name: json['productName'] as String,
      quantity: json['quantity'] as int,
      unitPrice: json['unitPrice'] as int,
      totalPrice: json['totalPrice'] as int,
      thumbnailImageUrl: json['thumbnailImageUrl'] as String? ?? '',
    );
  }

  ReviewSummaryProduct toReviewSummaryProduct() {
    return ReviewSummaryProduct(
      id: this.id,
      name: this.name,
      thumbnailImageUrl: this.thumbnailImageUrl,
    );
  }

}
