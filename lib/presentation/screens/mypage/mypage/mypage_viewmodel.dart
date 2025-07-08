
import 'package:flutter/foundation.dart';

import '../../../../core/secure/user_secure_storage.dart';

class MypageViewModel extends ChangeNotifier {

  bool _isLoggedIn = true;
  bool get isLoggedIn => _isLoggedIn;

  bool _isLoading = true;
  bool get isLoading => _isLoading;


  Future<void> logout() async {
    await UserSecureStorage.clearTokens();
    _isLoggedIn = false; // 필요하다면 상태값도 초기화
    notifyListeners();
  }

}