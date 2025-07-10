import 'package:damdiet/data/datasource/cart_datasource.dart';
import 'package:damdiet/data/models/cart/cart.dart';

class CartRepository {
  final CartDatasource _datasource;

  CartRepository(this._datasource);

  Future<Cart> fetchCart() async {
    return await _datasource.fetchCart();
  }

  Future<void> addToCart({
    required String productId,
    required int quantity,
    required int unitPrice,
    required Map<String, dynamic> options,
  }) async {
    await _datasource.addToCart(
      productId: productId,
      quantity: quantity,
      unitPrice: unitPrice,
      options: options,
    );
  }

  Future<void> removeItems(List<String> cartIds) async {
    await _datasource.removeItems(cartIds);
  }

  Future<void> clearCart() async {
    await _datasource.clearCart();
  }

  Future<void> updataQuantity({required String cartId, required int quantity}) async {
    await _datasource.updataQuantity(cartId: cartId, quantity: quantity);
  }
}
