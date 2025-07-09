class CartRequest {
  final String productId;
  final int quantity;
  final int unitPrice;
  final int discount;

  CartRequest({
    required this.productId,
    required this.quantity,
    required this.unitPrice,
    required this.discount,
  });

  factory CartRequest.fromJson(Map<String, dynamic> json) {
    return CartRequest(
      productId: json['productId'] as String,
      quantity: json['quantity'] as int,
      unitPrice: json['unitPrice'] as int,
      discount: json['discount'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'productId': productId,
      'quantity': quantity,
      'unitPrice': unitPrice,
      'discount': discount,
    };
  }
}
