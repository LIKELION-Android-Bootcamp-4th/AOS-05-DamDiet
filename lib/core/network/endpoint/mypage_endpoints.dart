class MyPageEndpoints {
  // 프로필 조회
  static const String getProfile = '/api/mypage/profile';

  // 프로필 수정
  static const String patchProfile = '/api/mypage/profile';

  // 비밀번호 변경
  static const String patchChangePassword = '/api/mypage/change-password';

  // 찜한 상품 목록 조회
  static const String getFavorites = '/api/mypage/favorites';

  // 작성 리뷰 목록 조회
  static const String getReviews = '/api/mypage/reviews';

  // 작성 댓글 목록 조회
  static const String getComments = '/api/mypage/comments';

  // 작성 게시글 목록 조회
  static const String getPosts = '/api/mypage/posts';

  // 내 주문 목록 조회
  static const String getOrders = '/api/mypage/orders';

  // 내 주문 상세 조회
  static String getOrderDetail({required String orderId}) =>
      '/api/mypage/orders/$orderId';

  // 최근 본 상품 조회
  static const String getRecentProducts = '/api/mypage/recent-products';
}
