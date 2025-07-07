class CartEndpoints {
  // 장바구니 조회
  static const getCart = '/api/cart';

  // 장바구니 상품 추가
  static const postCart = '/api/cart';

  // 장바구니 선택 상품 제거
  static const deleteCart = '/api/cart';

  // 장바구니 비우기
  static const clearCart = '/api/cart/clear';

  // 장바구니 상품으로 주문 생성
  static const cartCheckOut = '/api/cart/checkout';
}