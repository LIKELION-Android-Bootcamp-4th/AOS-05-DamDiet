import 'package:dio/dio.dart';
import '../api_client.dart';

class ProductService {
  Future<Response> getProducts() async {
    return await ApiClient.dio.get('/api/products');
  }
}
