import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../data/datasource/mypage_datasource.dart';
import '../../data/models/auth/user.dart';

class UserProvider extends ChangeNotifier {
  final MyPageDataSource _dataSource;
  final FlutterSecureStorage _storage;

  User? _user;
  User? get user => _user;

  bool _isLoading = true;
  bool get isLoading => _isLoading;

  UserProvider( this._dataSource, this._storage);


  Future<bool> fetchProfile() async {
    final token = await _storage.read(key: 'accessToken');

    if (token == null || token.isEmpty) {
      _user = null;
      notifyListeners();
      return false;
    }

    try {
      final response = await _dataSource.getProfile();
      _user = User.fromJson(response.data['data']);
      notifyListeners();
      return true;
    } catch (e) {
      _user = null;
      notifyListeners();
      return false;
    }
  }

  void clear() {
    _user = null;
    notifyListeners();
  }

  void updateNickname(String nickname) {
    _user = _user?.copyWith(nickName: nickname);
    notifyListeners();
  }
}
