import 'package:damdiet/data/datasource/favorite_datasource.dart';
import 'package:damdiet/data/models/favorite_product/favorite_product.dart';
import 'package:dio/dio.dart';

class FavoriteRepository {
  final FavoriteDatasource _datasource;
  FavoriteRepository(this._datasource);

  Future<List<FavoriteProduct>> fetchFavoriteProducts() async {
    final response = await _datasource.getFavorites();

    if (!response.success) {
      throw Exception('찜 목록을 불러오는데 실패했습니다: ${response.message}');
    }
    return response.data.items;
  }

  Future<bool> toggleFavorite({required String productId}) async {
    try {
      final response = await _datasource.toggleFavorite(productId: productId);
      final result = response.data['message']['result'];
      return result['isLiked'] as bool? ?? false;
    }
    on DioException catch (e) {
      print("Repository에서 에러 발생: ${e.response?.data['message']}");
      throw Exception('찜 처리 중 오류가 발생했습니다.');
    }
  }
}