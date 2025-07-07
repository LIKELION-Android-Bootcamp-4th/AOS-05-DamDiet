class ProductEndpoints {

  // 상품 목록 검색
  static const String getProducts = '/api/products';
  // 상품 상세 조회
  static const String getProductDetail = '/api/products/{productId}';
  // 리뷰 작성
  static const String postReview = '/api/products/{productId}/reviews';
  // 리뷰 조회
  static const String getReviews = '/api/products/{productId}/reviews';
  // 상품 별 평균 평점 조회
  static const String getReviewAverage = '/api/products/{productId}/reviews/average';
  // 찜 여부 확인
  static const String getFavorites = '/api/products/{productId}/favorites';
  // 상품 찜 토글(추가 <-> 삭제)
  static const String postFavorites = '/api/products/{productId}/toggle-favorites';
  // 상품 댓글 작성
  static const String postComment = '/api/products/{productId}/comments';
  // 상품 댓글 조회
  static const String getComments = '/api/products/{productId}/comments';
  // 최근 본 상품 조회
  static const String getRecentProducts = '/api/recent-products';

}