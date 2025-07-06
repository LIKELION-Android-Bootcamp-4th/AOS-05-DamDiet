import 'address.dart';

class User {
  final String id;
  final String email;
  final String nickName;
  final Address? address;

  User({
    required this.id,
    required this.email,
    required this.nickName,
    this.address,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['_id'] as String,
      email: json['email'] as String,
      nickName: json['nickName'] as String,
      address: Address.fromJson(json['address'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'email': email,
      'nickName': nickName,
      'address': address?.toJson(),
    };
  }
}

