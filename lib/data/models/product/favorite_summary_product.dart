class FavoriteSummaryProduct {
  final String id;
  final String name;
  final int price;
  final String? thumbnailImageUrl;

  FavoriteSummaryProduct({
    required this.id,
    required this.name,
    required this.price,
    this.thumbnailImageUrl,
  });

  factory FavoriteSummaryProduct.fromJson(Map<String, dynamic> json) {
    return FavoriteSummaryProduct(
      id: json['id'],
      name: json['name'],
      price: json['price'],
      thumbnailImageUrl: json['thumbnailImageUrl'],
    );
  }
}