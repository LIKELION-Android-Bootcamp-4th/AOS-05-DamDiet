import 'package:damdiet/core/secure/user_secure_storage.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../constants/constants.dart';
import 'SessionExpiredException.dart';

class ApiClient {
  static final ApiClient _instance = ApiClient._internal();

  factory ApiClient() => _instance;

  late final Dio dio;

  ApiClient._internal() {
    dio = Dio(
      BaseOptions(
        baseUrl: BASE_URL,
        connectTimeout: const Duration(seconds: 5),
        receiveTimeout: const Duration(seconds: 3),
        headers: {
          'X-Company-Code': X_COMPANY_CODE,
        },
      ),
    );

    dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90,
        enabled: kDebugMode,
      ),
    );

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final accessToken = await UserSecureStorage.getAccessToken();

          if (accessToken != null) {
            options.headers['Authorization'] = 'Bearer $accessToken';
          }

          return handler.next(options);
        },
          //TODO 추후에 accessToken 갱신은 이어서 진행
          // AccessToken 만료 시, 갱신 후 이전 요청 다시 보내도록
          onError: (error, handler) async {
          final response = error.response;

          if (response?.statusMessage == 'AUTH_TOKEN_EXPIRED'){
            final refreshToken = await UserSecureStorage.getRefreshToken();

            final refreshResponse = await dio.post('/api/auth/refresh', data: {
              'refreshToken': refreshToken,
            });

            if (refreshResponse.statusCode == 200) {
              final newAccessToken = refreshResponse.data['accessToken'];
              await UserSecureStorage.saveAccessToken(newAccessToken);

              final retryRequest = error.requestOptions;
              retryRequest.headers['Authorization'] = 'Bearer $newAccessToken';

              final retryResponse = await dio.fetch(retryRequest);

              return handler.resolve(retryResponse);
            } else {
              UserSecureStorage.clearTokens();
              handler.reject(
                DioException(
                  requestOptions: error.requestOptions,
                  error: SessionExpiredException(),
                ),
              );
              return;
            }
          }
          return handler.next(error);
        }
      ),
    );
  }
}
