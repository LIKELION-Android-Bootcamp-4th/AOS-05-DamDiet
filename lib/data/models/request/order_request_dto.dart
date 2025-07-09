import '../auth/address.dart';

class OrderItem {
  final String product;
  final int quantity;
  final int unitPrice;

  OrderItem({
    required this.product,
    required this.quantity,
    required this.unitPrice,
  });

  Map<String, dynamic> toJson() {
    return {
      'product': product,
      'quantity': quantity,
      'unitPrice': unitPrice,
    };
  }
}

class ShippingInfo {
  final String recipientName;
  final String recipient;
  final Address address;
  final String recipientPhone;

  ShippingInfo({
    required this.recipientName,
    required this.recipient,
    required this.address,
    required this.recipientPhone,
  });

  Map<String, dynamic> toJson() {
    return {
      'recipientName': recipientName,
      'recipient': recipient,
      'address': address.toJson(),
      'phone': recipientPhone,
    };
  }
}

class OrderRequestDto {
  final List<OrderItem> items;
  final ShippingInfo shippingInfo;
  final String memo;
  final String paymentMethod;

  OrderRequestDto({
    required this.items,
    required this.shippingInfo,
    required this.memo,
    required this.paymentMethod,
  });

  Map<String, dynamic> toJson() {
    return {
      'items': items.map((item) => item.toJson()).toList(),
      'shippingInfo': shippingInfo.toJson(),
      'memo': memo,
      'paymentMethod': paymentMethod,
    };
  }
}
