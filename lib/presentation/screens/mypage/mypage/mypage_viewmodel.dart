
import 'package:damdiet/data/repositories/mypage_repository.dart';
import 'package:flutter/foundation.dart';

import '../../../../core/secure/user_secure_storage.dart';

class MypageViewModel extends ChangeNotifier {
  final MyPageRepository _repository;

  MypageViewModel(this._repository);

  bool _isLoading = true;
  bool get isLoading => _isLoading;

  Future<bool> changeDeliAddress({
    required String zipCode,
    required String address,
    required String addressDetail
  }) async {
    try {
     return await _repository.changeDeliAddress(
        address: {
          'zipCode': zipCode,
          'address1': address,
          'address2': addressDetail
        }
     );

    }
    catch(e) {
      debugPrint(e as String?);
      return false;
    }
  }


  Future<void> logout() async {
    await UserSecureStorage.clearTokens();
    notifyListeners();
  }
}