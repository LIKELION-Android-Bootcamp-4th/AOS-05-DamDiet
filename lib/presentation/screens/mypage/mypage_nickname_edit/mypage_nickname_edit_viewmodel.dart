import 'package:flutter/material.dart';

import '../../../../data/models/auth/profile_update_payload.dart';
import '../../../../data/repositories/mypage_repository.dart';
import '../../../provider/user_provider.dart';

class NicknameEditViewModel extends ChangeNotifier {
  final MyPageRepository _repository;
  final UserProvider _userProvider;

  NicknameEditViewModel(this._repository, this._userProvider);

  final TextEditingController nicknameController = TextEditingController();

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  void clearErrorMessage() {
    _errorMessage = null;
    notifyListeners();
  }

  bool validateNickname() {
    final nickname = nicknameController.text.trim();
    if (nickname.isEmpty) {
      _errorMessage = '닉네임을 입력해주세요.';
      notifyListeners();
      return false;
    }
    if (nickname.length < 2 || nickname.length > 10) {
      _errorMessage = '닉네임은 2글자 이상 10글자 이하 이어야 합니다.';
      notifyListeners();
      return false;
    }

    _errorMessage = null;
    notifyListeners();
    return true;
  }

  Future<bool> submitNickname() async {
    if (!validateNickname()) return false;

    _isLoading = true;
    notifyListeners();

    try {
      final payload = ProfileUpdatePayload(nickname: nicknameController.text.trim());
      final success = await _repository.changeProfile(payload: payload);
      if (success) {
        _userProvider.updateNickname(payload.nickname!);
      }
      return success;
    } catch (e) {
      _errorMessage = '닉네임 변경에 실패했습니다.';
      return false;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  @override
  void dispose() {
    nicknameController.dispose();
    super.dispose();
  }
}
