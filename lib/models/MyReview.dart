import 'Product.dart';

class MyReview {
  final String id;
  final Product product;
  final double rating;
  final String content;
  final List<String>? images;
  final DateTime createdAt;
  final DateTime updatedAt;

  MyReview({
    required this.id,
    required this.product,
    required this.rating,
    required this.content,
    this.images,
    required this.createdAt,
    required this.updatedAt,
  });

  factory MyReview.fromJson(Map<String, dynamic> json) {
    return MyReview(
      id: json['_id'] as String,
      product: Product.fromJson(json['productId'] as Map<String, dynamic>),
      rating: json['rating'] as double,
      content: json['content'] as String,
      images: json['images'] != null
          ? List<String>.from(json['images'] as List)
          : null,
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }
}
