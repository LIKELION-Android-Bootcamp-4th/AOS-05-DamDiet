
import 'package:damdiet/data/datasource/review_datasource.dart';
import 'package:damdiet/data/models/review/my_review.dart';
import 'package:image_picker/image_picker.dart';

class ReviewRepository {
  final ReviewDatasource _datasource;

  ReviewRepository(this._datasource);

  Future<List<MyReview>> fetchMyReviews() async {
    try {
      return await _datasource.fetchMyReviews();
    } catch (e) {
      print('ReviewRepository - fetchMyReviews 오류: $e');
      rethrow;
    }
  }

  Future<void> deleteReview(String reviewId) async {
    try {
      await _datasource.deleteReview(reviewId);
    } catch (e) {
      print('ReviewRepository - deleteReview 오류: $e');
      rethrow;
    }
  }

  Future<MyReview> fetchMyReviewDetail(String reviewId) async {
    try {
      return await _datasource.fetchReviewDetail(reviewId);
    } catch (e) {
      print('ReviewRepository - fetchMyReviewDetail 에러: $e');
      rethrow;
    }
  }

  Future<void> updateReview({
    required String reviewId,
    required String content,
    required double rating,
    required List<String> keepImageIds,
    required List<XFile> newImages,
  }) async {
    try {
      await _datasource.updateReview(
        reviewId: reviewId,
        content: content,
        rating: rating,
        keepImageIds: keepImageIds,
        newImages: newImages,
      );
    } catch (e) {
      print('ReviewRepository - updateReview 에러: $e');
      rethrow;
    }
  }
}