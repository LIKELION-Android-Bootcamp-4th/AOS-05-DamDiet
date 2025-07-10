import 'package:damdiet/data/models/product/review_summary_product.dart';

class MyReview {
  final String id;
  final ReviewSummaryProduct product;
  final int rating;
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

    List<String>? imageList;
    if (json['images'] != null) {
      imageList = (json['images'] as List)
          .map((image) => image['url'] as String)
          .toList();
    }

    return MyReview(
      id: json['id'] as String,
      product: ReviewSummaryProduct.fromJson(json['product'] as Map<String, dynamic>),
      rating: json['rating'] as int,
      content: json['comment'] as String,
      images: imageList,
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }

}
