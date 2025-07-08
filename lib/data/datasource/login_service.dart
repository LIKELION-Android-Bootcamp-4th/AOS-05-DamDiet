import 'package:damdiet/core/network/endpoint/auth_endpoints.dart';
import 'package:damdiet/data/models/response/api_response.dart';
import 'package:damdiet/data/models/response/login_response.dart';
import 'package:dio/dio.dart';

import '../../core/network/api_client.dart';

class LogInService {
  final dio = ApiClient().dio;

  Future<ApiResponse<LoginResponse>> signIn(
      String email,
      String password,
      ) async {
    final response = await dio.post(
      AuthEndpoints.login,
      data: {
        'email': email,
        'password': password,
      },
    );

    return ApiResponse.fromJson(
      response.data,
          (json) => LoginResponse.fromJson(json as Map<String, dynamic>),
    );
  }

  Future<Response> signUp(
      String email,
      String password,
      String nickName,
      ) async {
    final response = await dio.post(
      AuthEndpoints.signup,
      data: {
        'email': email,
        'password': password,
        'nickName': nickName,
      },
    );

    return response;
  }

}