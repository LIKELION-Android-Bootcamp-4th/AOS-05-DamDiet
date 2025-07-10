
class MyOrderItem {
  final int subtotalAmount;
  final int shippingCost;
  final int totalAmount;
  final String status;
  final String createdAt;
  final String orderNumber;
  final List<OrderProduct> products;
  final String id;

  MyOrderItem({
    required this.subtotalAmount,
    required this.shippingCost,
    required this.totalAmount,
    required this.status,
    required this.createdAt,
    required this.orderNumber,
    required this.products,
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
      products: (json['products'] as List<dynamic>?)
          ?.map((e) => OrderProduct.fromJson(e))
          .toList() ?? [],
      id: json['id'],
    );
  }
}

class OrderProduct {
  final String id;
  final String name;
  final String category;
  final int price;
  final String thumbnailImageUrl;

  OrderProduct({
    required this.id,
    required this.name,
    required this.category,
    required this.price,
    required this.thumbnailImageUrl,
  });

  factory OrderProduct.fromJson(Map<String, dynamic> json) {
    return OrderProduct(
      id: json['id'] as String,
      name: json['name'] as String,
      category: json['category'] as String? ?? '',
      price: json['price'] as int,
      thumbnailImageUrl: json['thumbnailImageUrl'] as String? ?? '',
    );
  }
}
