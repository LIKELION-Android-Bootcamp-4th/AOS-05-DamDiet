class ProductEndpoints {
  // 상품 목록 검색
  static const String getProducts = '/api/products';

  static Uri getProductsUri({required Map<String, dynamic> queryParameters}) {
    final stringParams = queryParameters.map((key, value) => MapEntry(key, value.toString()));
    return Uri.parse('/api/products').replace(queryParameters: stringParams);
  }

  // 상품 상세 조회
  static String getProductDetail({required String productId}) =>
      '/api/products/$productId';

  // 리뷰 작성
  static String postReview({required String productId}) =>
      '/api/products/$productId/reviews';

  // 리뷰 조회
  static String getReviews({required int productId}) =>
      '/api/products/$productId/reviews';

  // 상품 별 평균 평점 조회
  static String getReviewAverage({required int productId}) =>
      '/api/products/$productId/reviews/average';

  // 찜 여부 확인
  static String getFavorites({required int productId}) =>
      '/api/products/$productId/favorites';

  // 상품 댓글 작성
  static String postComment({required int productId}) =>
      '/api/products/$productId/comments';

  // 상품 댓글 조회
  static String getComments({required int productId}) =>
      '/api/products/$productId/comments';

  // 최근 본 상품 조회
  static const String getRecentProducts = '/api/recent-products';
}
