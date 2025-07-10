
import 'package:damdiet/data/datasource/review_datasource.dart';
import 'package:damdiet/data/models/review/my_review.dart';

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
}