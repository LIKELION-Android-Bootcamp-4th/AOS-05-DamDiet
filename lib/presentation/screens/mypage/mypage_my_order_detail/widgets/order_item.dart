class OrderItem {
  final String imageUrl;
  final String name;
  final String? optionName;
  final int quantity;
  final int price;
  final bool hasReview;
  OrderItem({
    required this.imageUrl,
    required this.name,
    this.optionName,
    required this.quantity,
    required this.price,
    required this.hasReview,
  });
}