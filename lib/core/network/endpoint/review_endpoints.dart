class ReviewEndpoints {

  // 리뷰 수정
  static const String putReview = '/api/reviews/{reviewId}';
  // 리뷰 삭제
  static const String deleteReview = '/api/reviews/{reviewId}';
  // 리뷰 이미지 개별 삭제
  static const String deleteReviewImage = '/api/reviews/{reviewId}/images/{imageId}';
}
