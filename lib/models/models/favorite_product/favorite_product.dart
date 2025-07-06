import '../../Product.dart';

//Product 는 필요에 따라 하단에 SummaryProduct 로 추후 분류해도 okay
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

