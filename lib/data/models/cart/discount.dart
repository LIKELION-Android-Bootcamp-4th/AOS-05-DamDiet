class Discount {
  final String type;
  final int value;


  Discount({
    required this.type,
    required this.value,
  });

  factory Discount.fromJson(Map<String, dynamic> json) {
    return Discount(
      type: json['type'] as String,
      value: json['value'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'amount': value,
    };
  }
}
