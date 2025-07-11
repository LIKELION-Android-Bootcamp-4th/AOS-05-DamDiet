
import 'package:damdiet/data/repositories/mypage_repository.dart';
import 'package:flutter/foundation.dart';

import '../../../../core/secure/user_secure_storage.dart';

class MypageViewModel extends ChangeNotifier {
  final MyPageRepository _repository;

  MypageViewModel(this._repository);

  bool _isLoading = true;
  String _zipCode = '';
  String _address = '';
  String _addressDetail = '';

  bool get isLoading => _isLoading;
  String get zipCode => _zipCode;
  String get address => _address;
  String get addressDetail => _addressDetail;


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
      debugPrint("배송지 변경 중 오류 발생: $e");
      return false;
    }
  }

  Future<void> getDeliAddress() async {
    try {
      Map<String, dynamic> mapAddress = await _repository.getDeliAddress();
      _zipCode = mapAddress['zipCode'] ?? '';
      _address = mapAddress['address1'] ?? '';
      _addressDetail = mapAddress['address2'] ?? '';
      debugPrint('addr: $_addressDetail');
      notifyListeners();
    }
    catch(e) {
      debugPrint("기본 배송지 로드 중 오류 발생: $e");
    }

  }


  Future<void> logout() async {
    await UserSecureStorage.clearTokens();
    notifyListeners();
  }
}