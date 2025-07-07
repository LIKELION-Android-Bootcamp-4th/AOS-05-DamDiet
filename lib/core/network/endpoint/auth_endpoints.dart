class AuthEndpoints {
  // 로그인
  static const String login = '/api/auth/login';

  // Access Token 갱신
  static const String refresh = '/api/auth/refresh';

  // 구매자 회원가입
  static const String buyerSignUp = '/api/auth/register/buyer';

  // 닉네임 중복 확인
  static const String checkNickname = '/api/auth/check-nickname';
}