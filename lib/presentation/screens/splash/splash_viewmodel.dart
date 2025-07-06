import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SplashViewModel extends ChangeNotifier {
  final FlutterSecureStorage _storage;

  SplashViewModel(this._storage);

  Future<String?> getToken() async {
    return await _storage.read(key: 'accessToken');
  }

  Future<void> checkLogin({
    required BuildContext context,
    required String homeRoute,
    required String loginRoute,
  }) async {
    final token = await getToken();
    if (token != null && token.isNotEmpty) {
      Navigator.pushReplacementNamed(context, homeRoute);
    } else {
      Navigator.pushReplacementNamed(context, loginRoute);
    }
  }
}
