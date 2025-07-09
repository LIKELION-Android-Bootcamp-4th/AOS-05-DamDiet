
//Product 는 필요에 따라 하단에 SummaryProduct 로 추후 분류해도 okay
import 'package:damdiet/data/models/product/favorite_summary_product.dart';

class FavoriteProduct {
  final String id;
  final FavoriteSummaryProduct product;
  final DateTime createdAt;

  FavoriteProduct({
    required this.id,
    required this.product,
    required this.createdAt,
  });

  factory FavoriteProduct.fromJson(Map<String, dynamic> json) {
    return FavoriteProduct(
      id: json['id'],
      product: FavoriteSummaryProduct.fromJson(json['entity']),
      createdAt: DateTime.parse(json['createdAt']),
    );
  }
}

