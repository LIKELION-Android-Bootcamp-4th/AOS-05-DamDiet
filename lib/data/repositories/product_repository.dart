import 'package:damdiet/data/datasource/product_datasource.dart';

import '../models/product/product.dart';



class ProductRepository {
  final ProductDatasource _datasource;

  ProductRepository(this._datasource);

  Future<List<Product>> getLatestProducts() async {
    final response = await _datasource.getProducts(sortBy: 'latest');
    if (!response.success) {
      throw Exception(response.message);
    }
    return response.data.items;
  }

  Future<List<Product>> getPopularProducts() async {
    final response = await _datasource.getProducts(sortBy: 'popular');
    if (!response.success) {
      throw Exception(response.message);
    }
    return response.data.items;
  }

  Future<List<Product>> getSalesProducts() async {
    final response = await _datasource.getProducts(sortBy: 'sales');
    if (!response.success) {
      throw Exception(response.message);
    }
    return response.data.items;
  }
}
