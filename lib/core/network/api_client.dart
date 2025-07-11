import 'package:damdiet/core/secure/user_secure_storage.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../constants/constants.dart';
import '../exceptions/session_expired_exception.dart';

class ApiClient {
  static final ApiClient _instance = ApiClient._internal();

  factory ApiClient() => _instance;

  late final Dio dio;

  ApiClient._internal() {
    dio = Dio(
      BaseOptions(
        baseUrl: BASE_URL,
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
        headers: {
          'X-Company-Code': X_COMPANY_CODE,
        },
      ),
    );


    dio.interceptors
      ..add(InterceptorsWrapper(
          onRequest: (options, handler) async {
            final accessToken = await UserSecureStorage.getAccessToken();

            if (accessToken != null) {
              options.headers['Authorization'] = 'Bearer $accessToken';
            }

            return handler.next(options);
          },

          onError: (error, handler) async {
            final response = error.response;

            if (response?.statusCode == 403 &&
                (response?.data['message'] == 'Invalid or expired token')){
              final refreshToken = await UserSecureStorage.getRefreshToken();

              final refreshResponse = await dio.post('/api/auth/refresh', data: {
                'refreshToken': refreshToken,
              });

              if (refreshResponse.statusCode == 200) {
                final newAccessToken = refreshResponse.data['data']['accessToken'];
                await UserSecureStorage.saveAccessToken(newAccessToken);

                final retryRequest = error.requestOptions;

                final updatedHeaders = Map<String, dynamic>.from(retryRequest.headers);
                updatedHeaders['Authorization'] = 'Bearer $newAccessToken';

                final retryResponse = await dio.request(
                  retryRequest.path,
                  data: retryRequest.data,
                  queryParameters: retryRequest.queryParameters,
                  options: Options(
                    method: retryRequest.method,
                    headers: updatedHeaders,
                    extra: {'isRetry': true},
                  ),
                );
                print('path: ${retryRequest.path}');
                print('method: ${retryRequest.method}');
                print('data: ${retryRequest.data}');
                print('queryParams: ${retryRequest.queryParameters}');

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
      ),)
      ..add(PrettyDioLogger(
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
  }
}
