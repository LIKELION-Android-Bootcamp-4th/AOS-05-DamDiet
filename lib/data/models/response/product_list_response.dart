import '../product/product.dart';

class ProductListResponse {
  final List<Product> items;
  //final int total;
  //final String sort;

  ProductListResponse({
    required this.items,
    //required this.total,
    //required this.sort,
  });

  factory ProductListResponse.fromJson(Map<String, dynamic> json) {
    return ProductListResponse(
      items: (json['items'] as List)
          .map((e) => Product.fromJson(e as Map<String, dynamic>))
          .toList(),
      //total: json['total'] as int,
      //sort: json['sort'] as String,
    );
  }
}
