class Product {
  final String? id;
  final String? name;
  //final String image;
  final int? price;
  final bool? isFavorite;
  //final int discount;
  //final List<String>? options;
  // final String? category;
  //final double? rating;
  // final int? calories;
  // final int? carbs;
  // final int? fat;
  // final int? protein;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.isFavorite,
    //required this.discount,
    //this.options,
    // this.category,
    //this.rating,
    // this.calories,
    // this.carbs,
    // this.fat,
    // this.protein,
    //required this.image
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['_id'] as String?,
      name: json['name'] as String?,
      price: json['price'] as int?,
      isFavorite: json['isFavorite'] as bool?,
      //discount: json['discount'] as int,
      // options: json['options'] != null
      //     ? List<String>.from(json['options'] as List)
      //     : null,
      // category: json['category'] as String?,
      // rating: json['rating'] != null ? (json['rating'] as num).toDouble() : null,
      // calories: json['calories'] as int?,
      // carbs: json['carbs'] as int?,
      // fat: json['fat'] as int?,
      // protein: json['protein'] as int?,
      //image: json['image'] as String
    );
  }
}
