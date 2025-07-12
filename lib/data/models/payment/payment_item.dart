class PaymentItem {
  const PaymentItem({
    required this.name,
    required this.price,
    required this.discount,
    required this.image
  });

  final String name;
  final int price;
  final int discount;
  final String image;
}