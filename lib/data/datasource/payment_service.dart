import 'dart:convert';

import 'package:damdiet/core/network/endpoint/cart_endpoints.dart';
import 'package:damdiet/core/network/endpoint/order_endpoints.dart';
import 'package:dio/dio.dart';

import '../../core/network/api_client.dart';

class PaymentService {
  final dio = ApiClient().dio;

  Future<Response> postOrder(List orders, String recipient,
      String address, String phone, String payment) async {
    final response = await dio.post(
      OrderEndpoints.postOrders,
      data: {
        'items': orders,
        'shippingInfo': {
          'recipient': recipient,
          'address': address,
          'phone': phone
        },
        'memo': payment
      }
    );
    if(response.statusCode == 201) {
      return response;
    } else {
      throw DioException(
      requestOptions: response.requestOptions,
      response: response,
      error: '결제 요청 실패: ${response.statusCode}',
    );
    }
  }

  Future<Response> postCartCheckout(List cartIds, String recipient,
      String address, String phone, String payment) async {
    final response = await dio.post(
        CartEndpoints.cartCheckOut,
        data: {
          'shippingInfo': {
            'recipient': recipient,
            'address': address,
            'phone': phone
          },
          'cartIds': cartIds,
          'payment': payment
        }
    );
    if(response.statusCode == 201) {
      return response;
    } else {
      throw DioException(
        requestOptions: response.requestOptions,
        response: response,
        error: '결제 요청 실패: ${response.statusCode}',
      );
    }


  }
}