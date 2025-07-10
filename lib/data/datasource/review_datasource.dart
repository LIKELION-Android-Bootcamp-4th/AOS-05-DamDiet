
import 'package:damdiet/core/network/api_client.dart';
import 'package:damdiet/core/network/endpoint/mypage_endpoints.dart';
import 'package:damdiet/data/models/review/my_review.dart';

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
}