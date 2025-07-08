import 'package:damdiet/core/network/api_client.dart';
import 'package:damdiet/core/network/endpoint/cart_endpoints.dart';
import 'package:damdiet/data/models/cart/cart.dart';

class CartRepository {
  final _dio = ApiClient().dio;

  Future<Cart> fetchCart() async {
    final response = await _dio.get(CartEndpoints.getCart);
    return Cart.fromJson(response.data);
  }

  Future<void> addToCart({
    required String productId,
    required int quantity,
    required int unitPrice,
    required Map<String, dynamic> options,
  }) async {
    await _dio.post(CartEndpoints.postCart, data: {
      'productId': productId,
      'quantity': quantity,
      'unitPrice': unitPrice,
      'options': options,
      'discount': null,
    });
  }

  Future<void> removeItems(List<String> cartIds) async {
    await _dio.delete(CartEndpoints.deleteCart, data: {'cartIds': cartIds});
  }

  Future<void> clearCart() async {
    await _dio.delete(CartEndpoints.clearCart);
  }
}