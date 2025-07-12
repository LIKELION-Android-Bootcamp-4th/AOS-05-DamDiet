import 'package:damdiet/data/datasource/mypage_datasource.dart';

import '../models/auth/profile_update_payload.dart';

class MyPageRepository {
  final MyPageDataSource _dataSource;

  MyPageRepository(this._dataSource);

  Future<bool> changeDeliAddress({
    required Map<String, String> address
  }) async{
    final response = await _dataSource.patchDeliAddress(
        address: address
    );
    if(response.statusCode != 200) {
      throw Exception(response.statusMessage);
    }
    else {
      return true;
    }
  }

  Future<bool> changeProfile({
    required ProfileUpdatePayload payload,
  }) async {
    final response = await _dataSource.patchProfile(payload: payload);

    if (response.statusCode != 200) {
      throw Exception(response.statusMessage);
    } else {
      return true;
    }
  }

  Future<Map<String, dynamic>> getDeliAddress() async {
    final response = await _dataSource.getProfile();

    if(response.statusCode != 200) {
      throw Exception(response.statusMessage);
    }
    else {
      return response.data['data']['address'];
    }
  }

  Future<bool> changePassword({
    required String currentPassword,
    required String newPassword,
    required String confirmPassword,
  }) async {
    final response = await _dataSource.patchPassword(
      currentPassword: currentPassword,
      newPassword: newPassword,
      confirmPassword: confirmPassword,
    );

    if (response.statusCode != 200) {
      throw Exception(response.statusMessage);
    } else {
      return true;
    }
  }
}