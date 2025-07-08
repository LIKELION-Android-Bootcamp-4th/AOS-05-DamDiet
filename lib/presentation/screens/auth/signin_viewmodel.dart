import 'package:damdiet/data/datasource/product_datasource.dart';
import 'package:flutter/material.dart';

import '../../../core/secure/user_secure_storage.dart';
import '../../../data/datasource/login_service.dart';
import '../../../data/repositories/login_repository.dart';

class SignInViewModel extends ChangeNotifier{
  final LoginRepository _repository = LoginRepository();

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
      await _repository.signIn(email, password);
      // 성공 시
      _isLoading = false;
      notifyListeners();
      return true;

    } catch (e) {
      _errorMessage = e.toString().replaceAll('Exception: ', '');
    }

    _isLoading = false;
    notifyListeners();
    return false;
  }
}
