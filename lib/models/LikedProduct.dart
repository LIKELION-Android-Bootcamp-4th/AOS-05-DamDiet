import 'Product.dart';

class LikedProduct {
  final String id; // _id
  final Product product;
  final DateTime likedAt;

  LikedProduct({
    required this.id,
    required this.product,
    required this.likedAt,
  });

  factory LikedProduct.fromJson(Map<String, dynamic> json) {
    return LikedProduct(
      id: json['_id'],
      product: Product.fromJson(json['productId']),
      likedAt: DateTime.parse(json['likedAt']),
    );
  }
}
