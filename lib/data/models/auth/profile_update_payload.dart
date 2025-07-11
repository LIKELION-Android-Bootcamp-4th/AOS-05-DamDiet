import 'package:damdiet/data/models/auth/address.dart';

class ProfileUpdatePayload {
  final String? nickname;
  final Address? address;


  ProfileUpdatePayload({
    this.nickname,
    this.address,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};

    if (nickname != null && nickname!.isNotEmpty) data['nickName'] = nickname;

    if (address != null) {
      final addressJson = address!.toJson();
      if (addressJson.isNotEmpty) {
        data['address'] = addressJson;
      }
    }

    return data;
  }
}
