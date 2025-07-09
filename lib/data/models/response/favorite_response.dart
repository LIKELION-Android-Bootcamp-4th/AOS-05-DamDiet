import 'package:damdiet/data/models/favorite_product/favorite_product.dart';

class FavoriteProductResponse {
  final List<FavoriteProduct> items;

  FavoriteProductResponse({
    required this.items,
  });

  factory FavoriteProductResponse.fromJson(Map<String, dynamic> json) {
    return FavoriteProductResponse(
      items: (json['items'] as List)
          .map((e) => FavoriteProduct.fromJson(e))
          .toList(),
    );
  }
}
