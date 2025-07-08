
import 'package:flutter/foundation.dart';

import '../../../../core/secure/user_secure_storage.dart';

class MypageViewModel extends ChangeNotifier {

  bool _isLoading = true;
  bool get isLoading => _isLoading;


  Future<void> logout() async {
    await UserSecureStorage.clearTokens();
    notifyListeners();
  }
}