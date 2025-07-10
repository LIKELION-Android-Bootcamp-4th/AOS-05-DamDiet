import 'my_order_item.dart';

class MyOrderDetail {
  final String id;
  final String orderNumber;
  final int subtotalAmount;
  final int shippingCost;
  final int totalAmount;
  final String status;
  final String createdAt;
  final String updatedAt;
  final String memo;
  final ShippingInfo shippingInfo;
  final List<StatusHistory> statusHistory;
  final List<OrderProduct> products;

  MyOrderDetail({
    required this.id,
    required this.orderNumber,
    required this.subtotalAmount,
    required this.shippingCost,
    required this.totalAmount,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.memo,
    required this.shippingInfo,
    required this.statusHistory,
    required this.products,
  });

  factory MyOrderDetail.fromJson(Map<String, dynamic> json) {
    return MyOrderDetail(
      id: json['id'],
      orderNumber: json['orderNumber'],
      subtotalAmount: json['subtotalAmount'],
      shippingCost: json['shippingCost'],
      totalAmount: json['totalAmount'],
      status: json['status'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      memo: json['memo'],
      shippingInfo: ShippingInfo.fromJson(json['shippingInfo']),
      statusHistory: (json['statusHistory'] as List<dynamic>?)
          ?.map((e) => StatusHistory.fromJson(e))
          .toList() ??
          [],
      products: (json['products'] as List<dynamic>?)
          ?.map((e) => OrderProduct.fromJson(e))
          .toList() ??
          [],
    );
  }
}


class ShippingInfo {
  final String recipient;
  final String address;
  final String phone;
  final String deliveryOption;

  ShippingInfo({
    required this.recipient,
    required this.address,
    required this.phone,
    required this.deliveryOption,
  });

  factory ShippingInfo.fromJson(Map<String, dynamic> json) {
    return ShippingInfo(
      recipient: json['recipient'],
      address: json['address'],
      phone: json['phone'],
      deliveryOption: json['deliveryOption'],
    );
  }
}

class StatusHistory {
  final String status;
  final String changedAt;
  final String note;
  final String id;

  StatusHistory({
    required this.status,
    required this.changedAt,
    required this.note,
    required this.id,
  });

  factory StatusHistory.fromJson(Map<String, dynamic> json) {
    return StatusHistory(
      status: json['status'],
      changedAt: json['changedAt'],
      note: json['note'],
      id: json['id'],
    );
  }
}