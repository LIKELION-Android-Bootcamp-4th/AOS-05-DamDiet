import 'package:flutter/material.dart';

import '../../../data/models/auth/profile_update_payload.dart';
import '../../../data/repositories/mypage_repository.dart';

class NicknameEditViewModel extends ChangeNotifier {
  final MyPageRepository _repository;

  NicknameEditViewModel(this._repository);

  final TextEditingController nicknameController = TextEditingController();

  String? errorMessage;
  bool isLoading = false;

  bool validateNickname() {
    final nickname = nicknameController.text.trim();
    if (nickname.isEmpty) {
      errorMessage = '닉네임을 입력해주세요.';
      notifyListeners();
      return false;
    }
    if (nickname.length < 2) {
      errorMessage = '닉네임은 2글자 이상이어야 합니다.';
      notifyListeners();
      return false;
    }

    errorMessage = null;
    notifyListeners();
    return true;
  }

  Future<bool> submitNickname() async {
    if (!validateNickname()) return false;

    isLoading = true;
    notifyListeners();

    try {
      final payload = ProfileUpdatePayload(nickname: nicknameController.text.trim());
      final success = await _repository.changeProfile(payload: payload);
      return success;
    } catch (e) {
      errorMessage = '닉네임 변경에 실패했습니다.';
      return false;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  @override
  void dispose() {
    nicknameController.dispose();
    super.dispose();
  }
}
