import '../order/my_order_item.dart';
import 'api_response.dart';

class MyOrdersResponse {
  final List<MyOrderItem> items;
  //final Pagination pagination;

  MyOrdersResponse({
    required this.items,
   // required this.pagination,
  });

  factory MyOrdersResponse.fromJson(Map<String, dynamic> json) {
    return MyOrdersResponse(
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => MyOrderItem.fromJson(e))
          .toList() ?? [],
      //pagination: Pagination.fromJson(json['pagination']),
    );
  }
}
