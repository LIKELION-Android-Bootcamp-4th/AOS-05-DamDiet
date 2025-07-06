import '../auth/address.dart';

class ShippingInfo {
  final String recipientName;
  final String recipientPhone;
  final Address address;
  final String trackingNumber;
  final String estimatedDelivery;

  ShippingInfo({
    required this.recipientName,
    required this.recipientPhone,
    required this.address,
    required this.trackingNumber,
    required this.estimatedDelivery,
  });

  factory ShippingInfo.fromJson(Map<String, dynamic> json) {
    return ShippingInfo(
      recipientName: json['recipientName'],
      recipientPhone: json['recipientPhone'],
      address: Address.fromJson(json['address']),
      trackingNumber: json['trackingNumber'],
      estimatedDelivery: json['estimatedDelivery'],
    );
  }
}
