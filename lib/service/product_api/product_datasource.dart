import 'package:damdiet/models/models/response/api_response.dart';
import 'package:dio/dio.dart';
import '../../core/network/api_client.dart';
import '../../models/models/response/product_list_response.dart';

class ProductDatasource {
  final dio = ApiClient().dio;

  Future<ApiResponse<ProductListResponse>> getProducts() async {
    final response = await dio.get('/products');

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
