class FavoriteProductEndpoints {
  // 관심 상품 목록 조회
  static String getFavorites = '/api/mypage/favorites';

  // 관심 상품 토글
  static String postFavorite({required String productId}) => '/api/products/$productId/toggle-favorites';
}