import 'package:damdiet/data/models/review/my_review.dart';
import 'package:damdiet/data/repositories/review_repository.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ReviewEditViewModel with ChangeNotifier {
  final ReviewRepository _repository;

  ReviewEditViewModel(this._repository, this.review);

  final MyReview review;

  Future<bool> updateReview({
    required String content,
    required double rating,
    required List<String> keepImageIds,
    required List<XFile> newImages,
  }) async {
    try {
      await _repository.updateReview(
        reviewId: review.id,
        content: content,
        rating: rating,
        keepImageIds: keepImageIds,
        newImages: newImages,
      );
      return true;
    } catch (e) {
      print('ViewModel - updateReview 에러: $e');
      return false;
    }
  }
}