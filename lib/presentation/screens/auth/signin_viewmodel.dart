import 'package:damdiet/data/datasource/product_datasource.dart';
import 'package:flutter/material.dart';

import '../../../core/secure/user_secure_storage.dart';
import '../../../data/datasource/login_service.dart';

class SignInViewModel extends ChangeNotifier{
  final LogInService _service = LogInService();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String _errorMessage = '';
  String get errorMessage => _errorMessage;


  String _email = '';
  String get email => _email;

  String _password = '';
  String get password => _password;

  void setEmail(String value) {
    _email = value;
    notifyListeners();
  }

  void setPassword(String value) {
    _password = value;
    notifyListeners();
  }

  Future<bool> signIn() async {
    _isLoading = true;
    _errorMessage = '';
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

          _isLoading = false;
          notifyListeners();
          return true;
        case 400:
          _errorMessage = '잘못된 요청입니다. 다시 시도해주세요';
          break;
        case 401:
          _errorMessage = '이메일 또는 비밀번호가 올바르지 않습니다.';
          break;
      }

    }catch(e) {
      print('Error: $e');
      _errorMessage = '네트워크 오류가 발생했습니다.';
    }

    _isLoading = false;
    notifyListeners();
    return false;
  }
}
