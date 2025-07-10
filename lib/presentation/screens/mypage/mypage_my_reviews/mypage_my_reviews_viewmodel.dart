import 'package:damdiet/data/models/review/my_review.dart';
import 'package:damdiet/data/repositories/review_repository.dart';
import 'package:flutter/material.dart';

class MyPageMyReviewsViewModel with ChangeNotifier {
  final ReviewRepository _repository;

  MyPageMyReviewsViewModel(this._repository);

  List<MyReview> _reviews = [];
  bool _isLoading = false;
  String? _errorMessage;

  List<MyReview> get reviews => _reviews;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<void> fetchMyReviews() async {
    _isLoading = true;
    notifyListeners();

    try {
      _reviews = await _repository.fetchMyReviews();
      _errorMessage = null;
    } catch (e) {
      _errorMessage = '리뷰를 불러오는 중 오류가 발생했습니다.';
      print(e);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}