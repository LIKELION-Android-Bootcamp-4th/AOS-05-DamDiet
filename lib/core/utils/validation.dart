class ValidationUtil {
  static final RegExp _passwordRegExp = RegExp(r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&~])[A-Za-z\d@$!%*#?&~]{8,}$');

  static bool isValidPassword(String input) {
    return _passwordRegExp.hasMatch(input);
  }
}
