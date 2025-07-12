
//Product 는 필요에 따라 하단에 SummaryProduct 로 추후 분류해도 okay
import 'package:damdiet/data/models/product/favorite_summary_product.dart';

class FavoriteProduct {
  final String id;
  final FavoriteSummaryProduct entity;


  FavoriteProduct({
    required this.id,
    required this.entity,
  });

  factory FavoriteProduct.fromJson(Map<String, dynamic> json) {
    return FavoriteProduct(
      id: json['id'],
      entity: FavoriteSummaryProduct.fromJson(json['entity']),
    );
  }
}

