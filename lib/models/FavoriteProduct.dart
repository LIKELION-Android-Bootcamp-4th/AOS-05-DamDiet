import 'Product.dart';

class FavoriteProduct {
  final String id; // _id
  final Product product;
  final DateTime likedAt;

  FavoriteProduct({
    required this.id,
    required this.product,
    required this.likedAt,
  });

  factory FavoriteProduct.fromJson(Map<String, dynamic> json) {
    return FavoriteProduct(
      id: json['_id'],
      product: Product.fromJson(json['productId']),
      likedAt: DateTime.parse(json['likedAt']),
    );
  }
}
