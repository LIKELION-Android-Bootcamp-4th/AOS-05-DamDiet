import '../review/my_review.dart';
import 'api_response.dart';

class MyReviewResponse {
  final List<MyReview> items;
  final Pagination? pagination;

  MyReviewResponse({
    required this.items,
    this.pagination,
  });

  factory MyReviewResponse.fromJson(Map<String, dynamic> json) {
    return MyReviewResponse(
      items: (json['items'] as List)
          .map((e) => MyReview.fromJson(e as Map<String, dynamic>))
          .toList(),
      pagination: json['pagination'] != null
          ? Pagination.fromJson(json['pagination'] as Map<String, dynamic>)
          : null,
    );
  }
}
