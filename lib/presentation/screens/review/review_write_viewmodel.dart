import 'package:damdiet/data/models/product/review_summary_product.dart';
import 'package:damdiet/data/repositories/review_repository.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ReviewWriteViewModel with ChangeNotifier {
  final ReviewRepository _repository;
  final ReviewSummaryProduct  product;
  final String orderId;

  ReviewWriteViewModel({
    required this.product,
    required this.orderId,
    required ReviewRepository repository,
  }) : _repository = repository;

  Future<bool> submitReview({
    required String content,
    required double rating,
    required List<XFile> images,
  }) async {
    try {
      await _repository.createReview(
        productId: product.id,
        orderId: orderId,
        content: content,
        rating: rating,
        images: images,
      );
      return true;
    } catch (e) {
      print('ViewModel - submitReview 오류: $e');
      return false;
    }
  }
}