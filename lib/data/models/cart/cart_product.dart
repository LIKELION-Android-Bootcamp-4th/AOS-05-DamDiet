class CartProduct {
  final String id;
  final String name;
  final int price;
  final List<String> images;

  CartProduct({
    required this.id,
    required this.name,
    required this.price,
    required this.images,
  });

  factory CartProduct.fromJson(Map<String, dynamic> json) {
    return CartProduct(
      id: json['id'],
      name: json['name'],
      price: json['price'],
      images: List<String>.from(json['images']),
    );
  }
}