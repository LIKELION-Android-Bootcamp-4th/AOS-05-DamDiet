
import 'package:damdiet/core/network/api_client.dart';
import 'package:damdiet/core/network/endpoint/mypage_endpoints.dart';
import 'package:damdiet/core/network/endpoint/product_endpoints.dart';
import 'package:damdiet/core/network/endpoint/review_endpoints.dart';
import 'package:damdiet/data/models/review/my_review.dart';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';

class ReviewDatasource {
  final dio = ApiClient().dio;

  Future<List<MyReview>> fetchMyReviews() async {
    final response = await dio.get(MyPageEndpoints.getReviews);


    if(response.statusCode == 200){
      final List<dynamic> itemList = response.data['data']['items'];
      return itemList.map((item) => MyReview.fromJson(item)).toList();
    } else {
      throw Exception('내가 작성한 리뷰 목록을 불러오는데 실패했습니다.');
    }
  }

  Future<void> deleteReview(String reviewId) async {
    final endporint = ReviewEndpoints.deleteReview(reviewId: reviewId);
    final response = await dio.delete(endporint);

    if(response.statusCode == 200 && response.data['success'] == true){
      return;
    }else {
    throw Exception('리뷰 삭제에 실패했습니다.: ${response.data['message']}');
    }
  }

  Future<MyReview> fetchReviewDetail(String reviewId) async {
    final endpoint = MyPageEndpoints.getReviews;
    final response = await dio.get(endpoint);

    if(response.statusCode == 200){
      return MyReview.fromJson(response.data['data']);
    } else {
      throw Exception('리뷰 상세 정보를 불러오는데 실패했습니다.');
    }
  }

  Future<void> updateReview({
    required String reviewId,
    required String content,
    required double rating,
    required List<String> keepImageIds,
    required List<XFile> newImages,
  }) async {
    final endpoint = ReviewEndpoints.putReview(reviewId: reviewId);

    final formData = FormData.fromMap({
      'rating': rating,
      'comment': content,
      'keepImageIds': keepImageIds,
    });

    for (var imageFile in newImages) {
      formData.files.add(MapEntry(
        'newImages',
        await MultipartFile.fromFile(imageFile.path),
      ));
    }

    final response = await dio.put(
      endpoint,
      data: formData,
    );

    if (response.statusCode != 200) {
      throw Exception('리뷰 수정에 실패했습니다: ${response.data['message']}');
    }
  }

  Future<void> createReview({
    required String productId,
    required String orderId,
    required String content,
    required double rating,
    required List<XFile> images,
  }) async {
    final endpoint = ProductEndpoints.postReview(productId: productId);

    final formData = FormData.fromMap({
      'orderId': orderId,
      'rating': rating,
      'comment': content,
    });

    for (var imageFile in images) {
      formData.files.add(MapEntry(
        'images',
        await MultipartFile.fromFile(imageFile.path),
      ));
    }

    final response = await dio.post(
      endpoint,
      data: formData,
    );

    if (response.statusCode != 201) {
      throw Exception('리뷰 등록에 실패했습니다: ${response.data?['message']}');
    }
  }
}