class QuantityInvalidException implements Exception {
  final String message;

  QuantityInvalidException([this.message = '수량을 1개 이상 선택해주세요']);

  @override
  String toString() => message;
}
