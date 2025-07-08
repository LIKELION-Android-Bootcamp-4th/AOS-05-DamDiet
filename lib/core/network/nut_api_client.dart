import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../constants/constants.dart';

class NutApiClient {
  static final NutApiClient _instance = NutApiClient._internal();

  factory NutApiClient() => _instance;

  late final Dio dio;

  NutApiClient._internal() {
    dio = Dio(
      BaseOptions(
        baseUrl: NUT_BASE_URL,
        connectTimeout: const Duration(seconds: 5),
        receiveTimeout: const Duration(seconds: 3),
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

  }
}