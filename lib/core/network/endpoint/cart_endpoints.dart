class CartEndpoints {
  // 장바구니 조회
  static const getCart = '/cart';

  // 장바구니 상품 추가
  static const postCart = '/cart';

  // 장바구니 선택 상품 제거
  static const deleteCart = '/cart';

  // 장바구니 비우기
  static const clearCart = '/cart/clear';

  // 장바구니 상품으로 주문 생성
  static const cartCheckOut = '/cart/checkout';
}