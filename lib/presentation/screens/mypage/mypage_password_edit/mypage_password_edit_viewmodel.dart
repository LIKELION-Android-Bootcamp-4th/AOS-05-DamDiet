import 'package:flutter/material.dart';

import '../../../../core/utils/validation.dart';
import '../../../../data/repositories/mypage_repository.dart';

class PasswordEditViewModel extends ChangeNotifier {
  final MyPageRepository _repository;

  PasswordEditViewModel(this._repository);

  final TextEditingController currentPasswordController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool validatePassword() {
    final newPw = newPasswordController.text.trim();
    final confirmPw = confirmPasswordController.text.trim();

    if (!ValidationUtil.isValidPassword(newPw)) {
      _errorMessage = '비밀번호는 8자 이상, 영문/숫자/특수문자를 포함해야 합니다.';
      notifyListeners();
      return false;
    }

    if (newPw != confirmPw) {
      _errorMessage = '새 비밀번호와 일치하지 않습니다.';
      notifyListeners();
      return false;
    }

    _errorMessage = null;
    notifyListeners();
    return true;
  }

  Future<bool> submitPassword() async {
    if (!validatePassword()) return false;

    _isLoading = true;
    notifyListeners();

    try {
      await _repository.changePassword(
        currentPassword: currentPasswordController.text.trim(),
        newPassword: newPasswordController.text.trim(),
        confirmPassword: confirmPasswordController.text.trim(),
      );
      return true;
    } catch (e) {
      _errorMessage = '비밀번호 변경에 실패했습니다.';
      return false;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  @override
  void dispose() {
    currentPasswordController.dispose();
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }
}
