class Tokens {
  final String accessToken;
  final String refreshToken;
  final int expiresIn;

  Tokens({
    required this.accessToken,
    required this.refreshToken,
    required this.expiresIn,
  });

  factory Tokens.fromJson(Map<String, dynamic> json) {
    return Tokens(
      accessToken: json['accessToken'] as String,
      refreshToken: json['refreshToken'] as String,
      expiresIn: json['expiresIn'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'accessToken': accessToken,
      'refreshToken': refreshToken,
      'expiresIn': expiresIn,
    };
  }
}
