class ProductFavoriteList {
  final String id;
  final String name;
  final int price;
  final String? thumbnailImageUrl;

  ProductFavoriteList({
    required this.id,
    required this.name,
    required this.price,
    this.thumbnailImageUrl,
  });

  factory ProductFavoriteList.fromJson(Map<String, dynamic> json) {
    return ProductFavoriteList(
      id: json['id'],
      name: json['name'],
      price: json['price'],
      thumbnailImageUrl: json['thumbnailImageUrl'],
    );
  }
}