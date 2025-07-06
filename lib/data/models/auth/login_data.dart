import 'package:damdiet/data/models/auth/tokens.dart';
import 'package:damdiet/data/models/auth/user.dart';

class LoginData {
  final User user;
  final Tokens tokens;

  LoginData({
    required this.user,
    required this.tokens,
  });

  factory LoginData.fromJson(Map<String, dynamic> json) {
    return LoginData(
      user: User.fromJson(json['user']),
      tokens: Tokens.fromJson(json['tokens']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user': user.toJson(),
      'tokens': tokens.toJson(),
    };
  }
}