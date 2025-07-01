import '../../models/Product.dart';
import '../api_client.dart';

class ProductService {
  Future<List<Product>> getProducts() async {
    final response = await ApiClient.dio.get('/api/products');
    final items = response.data['data']['items'] as List;
    return items.map((e) => Product.fromJson(e)).toList();
  }
}
