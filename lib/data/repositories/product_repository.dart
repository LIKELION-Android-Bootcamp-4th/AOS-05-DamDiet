import 'package:damdiet/data/datasource/product_datasource.dart';

import '../models/product/product.dart';



class ProductRepository {
  final ProductDatasource _datasource;

  ProductRepository(this._datasource);

  // 신제품
  Future<List<Product>> getLatestProducts() async {
    final response = await _datasource.getProducts(sortBy: 'latest');
    if (!response.success) {
      throw Exception(response.message);
    }
    return response.data.items;
  }

  // 인기순
  Future<List<Product>> getPopularProducts() async {
    final response = await _datasource.getProducts(sortBy: 'popular');
    if (!response.success) {
      throw Exception(response.message);
    }
    return response.data.items;
  }

  // 판매량
  Future<List<Product>> getSalesProducts() async {
    final response = await _datasource.getProducts(sortBy: 'sales');
    if (!response.success) {
      throw Exception(response.message);
    }
    return response.data.items;
  }

  Future<Product> getProductDetail({required String id}) async {
    final response = await _datasource.getProductsDetail(id: id);
    if (response.statusCode != 200) {
      throw Exception(response.statusMessage);
    }
    print(response.data);
    return Product.fromJson(response.data['data']);
  }
}
