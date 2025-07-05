import 'package:dio/dio.dart';

import '../api_client.dart';

class LogInService {
  Future<Response> signIn(String email, String password) async {
    return await ApiClient.dio.post('/api/auth/login', data: {
      'email': email,
      'password': password,
    });
  }
}