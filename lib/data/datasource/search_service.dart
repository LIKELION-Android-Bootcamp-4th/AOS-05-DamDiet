import 'package:damdiet/core/network/api_client.dart';
import 'package:dio/dio.dart';

import '../../core/network/endpoint/product_endpoints.dart';

class SearchService {
  final dio = ApiClient().dio;

  Future<Response> searchProducts() async {
    return await dio.get(
      ProductEndpoints.getProducts,
      data: {'page': 1, 'limit': 20, 'sortOrder': 'desc'},
    );
  }
}
