import 'package:damdiet/core/network/api_client.dart';
import 'package:dio/dio.dart';

import '../../core/network/endpoint/product_endpoints.dart';
import '../models/response/api_response.dart';
import '../models/response/product_list_response.dart';

class SearchService {
  final dio = ApiClient().dio;

  Future<ApiResponse<ProductListResponse>> searchProducts(String productName) async {
    final response =  await dio.get(
      ProductEndpoints.getProducts,
      queryParameters: {
        'page': 1,
        'limit': 20,
        // 'category': 'aa',
        'search': productName,
        'sortOrder': 'desc'
      },
    );


    if (response.statusCode == 200) {
      return ApiResponse<ProductListResponse>.fromJson(
        response.data,
            (json) => ProductListResponse.fromJson(json as Map<String, dynamic>),
      );
    } else {
      throw DioException(
        requestOptions: response.requestOptions,
        response: response,
        error: 'API 호출 실패: ${response.statusCode}',
      );
    }
  }
}
