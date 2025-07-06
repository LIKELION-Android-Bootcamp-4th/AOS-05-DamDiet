import 'product_summary.dart';

class OrderItem {
  final ProductSummary product;
  final int quantity;
  final int price;
  final int discountPrice;
  final String? options;

  OrderItem({
    required this.product,
    required this.quantity,
    required this.price,
    required this.discountPrice,
    required this.options,
  });

  factory OrderItem.fromJson(Map<String, dynamic> json) {
    return OrderItem(
      product: ProductSummary.fromJson(json['productId']),
      quantity: json['quantity'],
      price: json['price'],
      discountPrice: json['discountPrice'],
      options: json['options'] != null ? json['options'] as String : null,
    );
  }
}