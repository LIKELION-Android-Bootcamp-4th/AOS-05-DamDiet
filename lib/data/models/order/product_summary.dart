class ProductSummary {
  final String id;
  final String name;
  final String imageUrl;

  ProductSummary({
    required this.id,
    required this.name,
    required this.imageUrl,
  });

  factory ProductSummary.fromJson(Map<String, dynamic> json) {
    return ProductSummary(
      id: json['_id'],
      name: json['name'],
      imageUrl: json['imageUrl'],
    );
  }
}