import 'package:damdiet/core/network/api_client.dart';
import 'package:damdiet/core/network/endpoint/favorite_products_endpoints.dart';
import 'package:damdiet/data/models/response/api_response.dart';
import 'package:damdiet/data/models/response/favorite_response.dart';
import 'package:dio/dio.dart';

class FavoriteDatasource {
  final _dio = ApiClient().dio;

  Future<ApiResponse<FavoriteProductResponse>> getFavorites() async {
    final response = await _dio.get(FavoriteProductEndpoints.getFavorites);
    return ApiResponse.fromJson(
      response.data,
          (json) => FavoriteProductResponse.fromJson(json as Map<String, dynamic>),
    );
  }

  Future<Response> toggleFavorite({required String productId}) async {
    final uri = FavoriteProductEndpoints.postFavorite(productId: productId);
    return await _dio.post(uri);
  }

}