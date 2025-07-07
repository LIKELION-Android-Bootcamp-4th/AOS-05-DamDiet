import 'package:damdiet/data/models/product/product_nutrition.dart';
import 'package:damdiet/data/models/review/review.dart';



class Product {
  final String id;
  final String name;
  final String image;
  final int price;
  final bool isFavorite;
  final int discount;
  final String? category;
  final double rating;
  final ProductNutrition attributes;
  final List<Review>? reviews;
  final List<String>? options;

  Product({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
    required this.isFavorite,
    required this.discount,
    this.category,
    required this.rating,
    required this.attributes,
    this.reviews,
    this.options,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] as String,
      name: json['name'] as String,
      image: json['image'] as String,
      price: json['price'] is int
          ? json['price'] as int
          : int.tryParse(json['price']?.toString() ?? '') ?? 0,
      isFavorite: json['isFavorite'] as bool? ?? false,
      discount: json['discount'] as int,
      category: json['category'] as String?,
      rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
      attributes: ProductNutrition.fromJson(
        json['attributes'] as Map<String, dynamic>,
      ),
      reviews: json['reviews'] != null
          ? (json['reviews'] as List)
          .map((e) => Review.fromJson(e as Map<String, dynamic>))
          .toList()
          : null,
      options: json['options'] != null
          ? List<String>.from(json['options'] as List)
          : null,
    );
  }
}
