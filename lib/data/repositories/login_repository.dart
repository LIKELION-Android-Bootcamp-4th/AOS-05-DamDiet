import 'package:dio/dio.dart';

import '../../core/secure/user_secure_storage.dart';
import '../datasource/login_service.dart';

class LoginRepository {
  final LogInService _service = LogInService();

  Future<void> signIn(String email, String password) async {
    try {
      final response = await _service.signIn(email, password);

      if (response.success) {
        await UserSecureStorage.saveAccessToken(response.data.accessToken);
        await UserSecureStorage.saveRefreshToken(response.data.refreshToken);
      } else {
        throw Exception(response.message);
      }

    } on DioException catch (e) {
      final response = e.response?.data;
      final message = response?['message'] ?? '로그인 요청 실패';
      throw Exception(_convertMessage(message));
    }
  }

  String _convertMessage(String message) {
    switch (message) {
      case 'No user found with this email or company':
        return '입력하신 계정 정보가 존재하지 않습니다.';
      case 'passwords do not match':
        return '비밀번호가 일치하지 않습니다.';
      default:
        return '로그인 요청 실패';
    }
  }
}
