import 'dart:convert';

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
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] as String,
      name: json['name'] as String,
      image: json['thumbnailImageUrl'] as String,
      price: json['price'] is int
          ? json['price'] as int
          : int.tryParse(json['price']?.toString() ?? '') ?? 0,
      isFavorite: json['isFavorite'] as bool? ?? false,
      discount: (() {
        final raw = json['discount'];

        if (raw is int) {
          return raw;
        } else if (raw is String) {
          try {
            final parsed = jsonDecode(raw);
            if (parsed is Map && parsed['value'] != null) {
              return int.tryParse(parsed['value'].toString()) ?? 0;
            }
          } catch (e) {
            return int.tryParse(raw) ?? 0;
          }
          return 0;
        } else if (raw is Map && raw['value'] != null) {
          return int.tryParse(raw['value'].toString()) ?? 0;
        } else {
          return 0;
        }
      })(),
      category: json['category'] as String?,
      rating: (json['reviewStats']?['averageRating'] as num?)?.toDouble() ?? 0.0,
      attributes: ProductNutrition.fromJson(
        json['attributes'] as Map<String, dynamic>,
      ),
      reviews: json['reviews'] != null
          ? (json['reviews'] as List)
          .map((e) => Review.fromJson(e as Map<String, dynamic>))
          .toList()
          : null,
    );
  }
}

extension ProductCopyWith on Product {
  Product copyWith({
    bool? isFavorite,
}){
    return Product(
      id: id,
      name: name,
      image: image,
      price: price,
      isFavorite: isFavorite ?? this.isFavorite,
      discount: discount,
      category: category,
      rating: rating,
      attributes: attributes,
      reviews: reviews,
    );
  }
}