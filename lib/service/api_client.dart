import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class ApiClient {
  static final Dio dio = Dio(
    BaseOptions(
      baseUrl: 'http://git.hansul.kr:3000/',
      headers: {
        'Authorization': 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2ODVmNjlmYzQzOTkyMmMwOWMyMWFlZjMiLCJjb21wYW55SWQiOiI2ODVmNjlmYzQzOTkyMmMwOWMyMWFlZjAiLCJpc0FkbWluIjp0cnVlLCJpc1N1cGVyQWRtaW4iOnRydWUsImlhdCI6MTc1MTMzOTI2OCwiZXhwIjoxNzUxNDI1NjY4fQ.oRj5tVMltqCJ0Su_lVZy9PGiUyZ94NVFS4DnI4_Pc1w',
        'X-Company-Code': '685f69fc439922c09c21aef0'
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