class CartProduct {
  final String id;
  final String name;
  final int unitPrice;
  final String thumbnailImage;
  final Map<String, dynamic> options;
  final int discount;

  CartProduct({
    required this.id,
    required this.name,
    required this.unitPrice,
    required this.thumbnailImage,
    required this.options,
    required this.discount,
  });

  factory CartProduct.fromJson(Map<String, dynamic> json) {
    return CartProduct(
      id: json['id'],
      name: json['name'],
      unitPrice: json['unitPrice'],
      thumbnailImage: json['thumbnailImage']['url'],
      options: json['options'] as Map<String, dynamic>,
      discount: json['discount']==null? 0 : json['discount']['amount'],
    );
  }
}