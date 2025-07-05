import 'package:damdiet/constants/constants.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class ApiClient {
  static final Dio dio = Dio(
    BaseOptions(
      baseUrl: BASE_URL,
      headers: {
        'Authorization': ACCESS_TOKEN,
        'X-Company-Code': X_COMPANY_CODE,
      },
    ),
  )..interceptors.add(
    PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      error: true,
      compact: true,
      maxWidth: 90,
      enabled: kDebugMode,
      filter: (options, args) {
        if (options.path.contains('/posts')) {
          return false;
        }
        return !args.isResponse || !args.hasUint8ListData;
      },
    ),
  );
}