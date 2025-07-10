class ReviewSummaryProduct {
  final String id;
  final String name;
  final String? thumbnailImageUrl;

  ReviewSummaryProduct({
    required this.id,
    required this.name,
    this.thumbnailImageUrl,
  });

  factory ReviewSummaryProduct.fromJson(Map<String, dynamic> json) {
    return ReviewSummaryProduct(
      id: json['id'] as String,
      name: json['name'] as String,
      thumbnailImageUrl: json['thumbnailImageUrl'] as String?,
    );
  }
}