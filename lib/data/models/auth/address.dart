class Address {
  final String zipCode;
  final String address1;
  final String address2;

  Address({
    required this.zipCode,
    required this.address1,
    required this.address2,
  });

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      zipCode: json['zipCode'] as String,
      address1: json['address1'] as String,
      address2: json['address2'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'zipCode': zipCode,
      'address1': address1,
      'address2': address2,
    };
  }
}
