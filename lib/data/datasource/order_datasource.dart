import 'package:damdiet/data/models/response/api_response.dart';
import 'package:dio/dio.dart';

import '../../core/network/api_client.dart';
import '../../core/network/endpoint/order_endpoints.dart';
import '../models/order/my_order_detail.dart';
import '../models/response/my_orders_response.dart';

class OrderDataSource {
  final dio = ApiClient().dio;

  Future<ApiResponse<MyOrdersResponse>> getOrders() async {
    final response = await dio.get(OrderEndpoints.getOrders);

    if (response.statusCode == 200) {
      return ApiResponse.fromJson(
        response.data,
            (json) => MyOrdersResponse.fromJson(json as Map<String, dynamic>),
      );
    } else {
      throw DioException(
        requestOptions: response.requestOptions,
        response: response,
        error: '내 주문 목록 불러오기 실패: ${response.statusCode}',
      );
    }
  }

  Future<ApiResponse<MyOrderDetail>> getOrderDetail(String orderId) async {
    final response = await dio.get(OrderEndpoints.getOrderDetail(orderId));
    if (response.statusCode == 200) {
      return ApiResponse.fromJson(
        response.data,
            (json) => MyOrderDetail.fromJson(json as Map<String, dynamic>),
      );
    } else {
      throw DioException(
        requestOptions: response.requestOptions,
        response: response,
        error: '내 주문 목록 불러오기 실패: ${response.statusCode}',
      );
    }
  }
}
