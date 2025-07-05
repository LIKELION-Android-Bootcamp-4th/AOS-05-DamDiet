import 'package:dio/dio.dart';
import '../../core/network/api_client.dart';

class ProductService {
  final dio = ApiClient().dio;

  Future<Response> getProducts() async {
    return await dio.get('/api/products');
  }
}
