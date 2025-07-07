import 'package:damdiet/core/network/api_client.dart';
import 'package:dio/dio.dart';

import '../../core/network/endpoint/product_endpoints.dart';

class SearchService {
  final dio = ApiClient().dio;

  Future<Response> searchProducts(String productName) async {
    return await dio.get(
      ProductEndpoints.getProducts,
      queryParameters: {
        'page': 1,
        'limit': 20,
        // 'category': 'aa',
        'search': productName,
        'sortOrder': 'desc'
      },
    );
  }
}
