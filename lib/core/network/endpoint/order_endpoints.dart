class OrderEndpoints {
  // 주문 생성
  static String postOrders = '/api/orders';

  // 내 주문 목록 조회
  static String getOrders = '/api/orders';

  // 주문 상세 조회
  static String getOrderDetail(String orderId) => '/api/orders/$orderId';

}