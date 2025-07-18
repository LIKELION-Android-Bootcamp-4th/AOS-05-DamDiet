import 'package:damdiet/data/models/response/api_response.dart';
import 'package:dio/dio.dart';
import '../../core/network/api_client.dart';
import '../../core/network/endpoint/mypage_endpoints.dart';
import '../models/auth/profile_update_payload.dart';

class MyPageDataSource {
  final dio = ApiClient().dio;

  //TODO 추후에 아래 로직으로 교체
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

  Future<Response> patchProfile({
    required ProfileUpdatePayload payload,
  }) async {
    final response = await dio.patch(
      MyPageEndpoints.patchProfile,
      data: payload.toJson(),
    );

    if (response.statusCode != 200) {
      throw DioException(
        requestOptions: response.requestOptions,
        response: response,
        error: '프로필 변경 실패: ${response.statusCode}',
      );
    } else {
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

  Future<Response> patchPassword({
    required String currentPassword,
    required String newPassword,
    required String confirmPassword,
  }) async {
    final response = await dio.patch(
      MyPageEndpoints.patchChangePassword,
      data: {
        "currentPassword": currentPassword,
        "newPassword": newPassword,
        "confirmPassword": confirmPassword,
      },
    );

    if (response.statusCode != 200) {
      throw DioException(
        requestOptions: response.requestOptions,
        response: response,
        error: '비밀번호 변경 실패: ${response.statusCode}',
      );
    } else {
      return response;
    }
  }


}