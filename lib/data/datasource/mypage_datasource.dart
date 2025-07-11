import 'package:damdiet/data/models/response/api_response.dart';
import 'package:dio/dio.dart';
import '../../core/network/api_client.dart';
import '../../core/network/endpoint/mypage_endpoints.dart';

class MyPageDataSource {
  final dio = ApiClient().dio;

  Future<Response> patchDeliAddress({
    required Map<String, String> address
  }) async {
    final response = await dio.patch(
      MyPageEndpoints.patchProfile,
      data: {
        'address': address
      }
    );

    if(response.statusCode != 200) {
      throw DioException(
        requestOptions: response.requestOptions,
        response: response,
        error: '프로필 변경 실패: ${response.statusCode}',
      );
    }
    else {
      return response;
    }
  }

  Future<Response> getProfile() async {
    final response = await dio.get(MyPageEndpoints.getProfile);
    if(response.statusCode != 200) {
      throw DioException(
        requestOptions: response.requestOptions,
        response: response,
        error: '프로필 불러오기 실패: ${response.statusCode}',
      );
    }
    else {
      return response;
    }
  }

}