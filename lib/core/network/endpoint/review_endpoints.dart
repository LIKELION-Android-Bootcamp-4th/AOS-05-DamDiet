class ReviewEndpoints {
  // 리뷰 수정
  static String putReview({required String reviewId}) =>
      '/api/reviews/$reviewId';

  // 리뷰 삭제
  static String deleteReview({required String reviewId}) =>
      '/api/reviews/$reviewId';

  // 리뷰 이미지 개별 삭제
  static String deleteReviewImage({
    required String reviewId,
    required String imageId,
  }) =>
      '/api/reviews/$reviewId/images/$imageId';
}
