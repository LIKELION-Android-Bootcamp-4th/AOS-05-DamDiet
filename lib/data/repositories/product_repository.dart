import 'package:damdiet/data/datasource/product_datasource.dart';

import '../models/product/product.dart';



class ProductRepository {
  final ProductDatasource _datasource;

  ProductRepository(this._datasource);

  Future<List<Product>> getProducts() async {
    final response = await _datasource.getProducts();

    if (!response.success) {
      throw Exception(response.message);
    }

    return response.data.items;
  }

}
