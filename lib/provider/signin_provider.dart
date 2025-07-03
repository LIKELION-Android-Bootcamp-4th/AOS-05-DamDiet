import 'package:damdiet/service/product_api/product_api.dart';
import 'package:flutter/material.dart';

import '../core/secure/user_secure_storage.dart';
import '../service/product_api/login_service.dart';

class SignInProvider extends ChangeNotifier{
  final LogInService _service = LogInService();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String _errorMessage = '';
  String get errorMessage => _errorMessage;

  Future<void> signIn(String email, String password) async {
    _isLoading = true;
    notifyListeners();

    try {
      final response = await _service.signIn(email, password);

      switch(response.statusCode) {
        case 200:
          print('Success: ${response.data}');

          final storedAccessToken = await UserSecureStorage.getAccessToken();
          final storedRefreshToken = await UserSecureStorage.getRefreshToken();

          if (storedAccessToken == null) {
            await UserSecureStorage.saveAccessToken(response.data['data']['accessToken']);
          }
          if (storedRefreshToken == null) {
            await UserSecureStorage.saveRefreshToken(response.data['data']['refreshToken']);
          }

          break;
        case 400:
          _errorMessage = '잘못된 요청입니다. 다시 시도해주세요';
        case 401:
          _errorMessage = '이메일 또는 비밀번호가 올바르지 않습니다.';
      }

    }catch(e) {
      print('Error: $e');
    }

    _isLoading = false;
    notifyListeners();
    }
}
