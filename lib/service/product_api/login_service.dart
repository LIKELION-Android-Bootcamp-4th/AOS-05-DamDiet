import 'package:dio/dio.dart';

import '../../core/network/api_client.dart';

class LogInService {
  final dio = ApiClient().dio;

  Future<Response> signIn(String email, String password) async {
    return await dio.post('/api/auth/login', data: {
      'email': email,
      'password': password,
    });
  }
}