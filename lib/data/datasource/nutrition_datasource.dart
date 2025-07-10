import 'package:damdiet/core/constants/constants.dart';
import 'package:damdiet/data/models/kcal/product_nutrition.dart';
import 'package:damdiet/data/models/response/nut_api_response.dart';
import 'package:dio/dio.dart';

import '../../core/network/nut_api_client.dart';

class NutritionDataSource {
  final dio = NutApiClient().dio;

  Future<NutApiResponse> searchNutrition(String foodName, String? company) async {
    final response = await dio.get(
      '/getFoodNtrCpntDbInq02',
      queryParameters: {
        'serviceKey': NUT_SERVICE_KEY,
        'pageNo': 1,
        'numOfRows': 20,
        'type': 'json',
        'FOOD_NM_KR': foodName,
        'MAKER_NM': company
      }
    );

    if (response.statusCode == 200) {
      return NutApiResponse.fromJson(response.data);
    } else {
      throw DioException(
        requestOptions: response.requestOptions,
        response: response,
        error: 'API 호출 실패: ${response.statusCode}',
      );
    }
  }
}
