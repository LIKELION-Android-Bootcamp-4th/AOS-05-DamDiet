import 'package:damdiet/data/models/response/pagination.dart';

import '../product/product.dart';

class ProductListResponse {
  final List<Product> items;
  final Pagination pagination;

  ProductListResponse({
    required this.items,
    required this.pagination,
  });

  factory ProductListResponse.fromJson(Map<String, dynamic> json) {
    return ProductListResponse(
      items: List<Product>.from(
        json['items'].map((item) => Product.fromJson(item)),
      ),
      pagination: Pagination.fromJson(json['pagination']),
    );
  }
}
