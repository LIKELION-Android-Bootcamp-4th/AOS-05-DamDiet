class Product {
  final String id;
  final String name;
  final String image;
  final int price;
  final bool isFavorite;
  final String discount;
  final String category;
  final double rating;
  //final ProductNutrition nutrition;
  // final List<Review>? reviews;
  // final List<String>? options;

  Product({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
    required this.isFavorite,
    required this.discount,
    required this.category,
    required this.rating,
    //required this.nutrition,
    //this.reviews,
    //this.options,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] as String,
      name: json['name'] as String,
      image: json['images'] as String,
      price: json['price'] as int,
      isFavorite: json['isFavorite'] as bool? ?? false,
      discount: json['discount'] as String? ?? "0",
      category: json['category'] as String? ?? "닭가슴살",
      rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
      //nutrition: ProductNutrition.fromJson(json),
      // reviews: json['reviews'] != null
      //     ? (json['reviews'] as List)
      //     .map((e) => Review.fromJson(e as Map<String, dynamic>))
      //     .toList()
      //     : null,
      // options: json['options'] != null
      //     ? List<String>.from(json['options'] as List)
      //     : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'image': image,
      'price': price,
      'isFavorite': isFavorite,
      'discount': discount,
      'category': category,
      'rating': rating,
      //...nutrition.toJson(),
      //'reviews': reviews?.map((e) => e.toJson()).toList(),
      //'options': options,
    };
  }
}
