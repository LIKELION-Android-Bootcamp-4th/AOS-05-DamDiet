import 'package:damdiet/data/datasource/product_datasource.dart';

import '../models/cart/cart_request.dart';
import '../models/product/product.dart';
import '../models/product/product_query.dart';



class ProductRepository {
  final ProductDatasource _datasource;

  ProductRepository(this._datasource);

  Future<List<Product>> getProducts({required ProductQuery query}) async {
    final response = await _datasource.getProducts(query: query);
    if (!response.success) {
      throw Exception(response.message);
    }
    return response.data.items;
  }

  Future<Product> getProductDetail({required String id}) async {
    final apiResponse = await _datasource.getProductsDetail(id: id);

    if (!apiResponse.success) {
      throw Exception(apiResponse.message);
    }
    return apiResponse.data;
  }


  Future<bool> toggleFavorite({required String id}) async {
    final response = await _datasource.toggleFavorite(id: id);
    if (response.statusCode == 200) {
      final isFavorite = response.data['message']['result']['isLiked'] as bool;
      return isFavorite;
    }
    throw Exception(response.statusMessage);
  }

  Future<void> postCart({required CartRequest cartRequest}) async {
    final response = await _datasource.postCart(cartRequest: cartRequest);
    if (response.statusCode != 201) {
      throw Exception(response.statusMessage);
    }
  }
}
