class CartProduct {
  final String id;
  final String name;
  final int unitPrice;
  final String thumbnailImage;
  final Map<String, dynamic> options;

  CartProduct({
    required this.id,
    required this.name,
    required this.unitPrice,
    required this.thumbnailImage,
    required this.options,
  });

  factory CartProduct.fromJson(Map<String, dynamic> json) {
    return CartProduct(
      id: json['id'],
      name: json['name'],
      unitPrice: json['unitPrice'],
      thumbnailImage: json['thumbnailImage']['url'],
      options: json['options'] as Map<String, dynamic>,
    );
  }
}