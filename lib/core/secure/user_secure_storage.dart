import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class UserSecureStorage {
  static const _storage = FlutterSecureStorage(); //각 플랫폼 내부저장소 사용 어플종료해도 값을 암호화해서 가지고있는다

  static const _accessToken = "accessToken";// 내부 저장소에 저장시 사용 할 key 값
  static const _refreshToken = "refreshToken";

  // refreshToken 저장
  static Future<void> saveAccessToken(String accessToken) async {
    await _storage.write(key: _accessToken, value: accessToken);
    _debugLog('Access token saved: $accessToken');
  }

  // refreshToken 읽기
  static Future<String?> getAccessToken() async {
    _debugLog('Access token get: $_accessToken');
    return await _storage.read(key: _accessToken);
  }

  // 삭제 
  static Future<void> deleteAccessToken() async {
    await _storage.delete(key: _accessToken);
    _debugLog('Access token deleted');
  }

  // refreshToken 저장
  static Future<void> saveRefreshToken(String refreshToken) async {
    await _storage.write(key: _refreshToken, value: refreshToken);
    _debugLog('Refresh token saved: $refreshToken');
  }

  // refreshToken 읽기
  static Future<String?> getRefreshToken() async {
    _debugLog('Refresh token get: $_refreshToken');
    return await _storage.read(key: _refreshToken);
  }

  // 삭제
  static Future<void> deleteRefreshToken() async {
    await _storage.delete(key: _refreshToken);
    _debugLog('Refresh token deleted');
  }

  // 둘 다 한 번에 지우는 함수 - 로그아웃 시
  static Future<void> clearTokens() async {
    await _storage.delete(key: _accessToken);
    await _storage.delete(key: _refreshToken);
    _debugLog('Tokens cleared');
  }

  static void _debugLog(String message) {
    if(kDebugMode) {
      debugPrint(message);
    }
  }

}