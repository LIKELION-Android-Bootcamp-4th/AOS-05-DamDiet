class ReviewEndpoints {
  // 리뷰 수정
  static String putReview({required int reviewId}) =>
      '/api/reviews/$reviewId';

  // 리뷰 삭제
  static String deleteReview({required int reviewId}) =>
      '/api/reviews/$reviewId';

  // 리뷰 이미지 개별 삭제
  static String deleteReviewImage({
    required int reviewId,
    required int imageId,
  }) =>
      '/api/reviews/$reviewId/images/$imageId';
}
