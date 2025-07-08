import 'package:damdiet/data/repositories/login_repository.dart';
import 'package:flutter/foundation.dart';

import '../../../core/utils/validation.dart';

class SignUpViewModel extends ChangeNotifier{
  final LoginRepository _repository = LoginRepository();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String _errorMessage = '';
  String get errorMessage => _errorMessage;

  String _email = '';
  String get email => _email;

  String _password = '';
  String get password => _password;

  String _nickname = '';
  String get nickname => _nickname;

  String _confirmPassword = '';
  String get confirmPassword => _confirmPassword;

  void setEmail(String value) {
    _email = value;
    notifyListeners();
  }

  void setPassword(String value) {
    _password = value;
    notifyListeners();
  }

  void setConfirmPassword(String value) {
    _confirmPassword = value;
    notifyListeners();
  }

  void setNickname(String value) {
    _nickname = value;
    notifyListeners();
  }


  bool validateInputs() {
    if (_email.isEmpty) {
      _errorMessage = '이메일을 입력해주세요.';
      notifyListeners();
      return false;
    }
    if (_password.isEmpty) {
      _errorMessage = '비밀번호를 입력해주세요.';
      notifyListeners();
      return false;
    }
    if (_confirmPassword.isEmpty) {
      _errorMessage = '비밀번호 확인을 입력해주세요.';
      notifyListeners();
      return false;
    }
    if (_nickname.isEmpty) {
      _errorMessage = '닉네임을 입력해주세요.';
      notifyListeners();
      return false;
    }
    if (!ValidationUtil.isValidPassword(_password)) {
      _errorMessage = '비밀번호는 8자 이상, 영문/숫자/특수문자를 포함해야 합니다.';
      notifyListeners();
      return false;
    }
    if (_password != _confirmPassword) {
      _errorMessage = '비밀번호가 일치하지 않습니다.';
      notifyListeners();
      return false;
    }
    _errorMessage = '';
    notifyListeners();
    return true;
  }

  Future<bool> signUp() async {
    if (!validateInputs()) return false;

    _isLoading = true;
    _errorMessage = '';
    notifyListeners();

    try {
      await _repository.signUp(email, password, nickname);

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