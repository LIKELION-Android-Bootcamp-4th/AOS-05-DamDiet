import 'package:damdiet/core/network/endpoint/order_endpoints.dart';
import 'package:dio/dio.dart';

import '../../core/network/api_client.dart';

class PaymentService {
  final dio = ApiClient().dio;

  Future<Response> postOrder() async {
    final response = await dio.post(
      OrderEndpoints.postOrders,
      data: {
        'items': [
          {

          }
        ]
      }
    );

    return response;
  }
}