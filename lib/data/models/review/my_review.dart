import 'package:damdiet/data/models/product/review_summary_product.dart';

class ReviewImage {
  final String id;
  final String url;

  ReviewImage({required this.id, required this.url});

  factory ReviewImage.fromJson(Map<String, dynamic> json) {
    return ReviewImage(
      id: json['id'] ?? '',
      url: json['url'] ?? '',
    );
  }
}

class MyReview {
  final String id;
  final ReviewSummaryProduct product;
  final int rating;
  final String content;
  final List<ReviewImage> images;
  final DateTime createdAt;
  final DateTime updatedAt;

  MyReview({
    required this.id,
    required this.product,
    required this.rating,
    required this.content,
    required this.images,
    required this.createdAt,
    required this.updatedAt,
  });

  factory MyReview.fromJson(Map<String, dynamic> json) {
    var imageList = <ReviewImage>[];
    if (json['images'] != null) {
      json['images'].forEach((v) {
        imageList.add(ReviewImage.fromJson(v));
      });
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
