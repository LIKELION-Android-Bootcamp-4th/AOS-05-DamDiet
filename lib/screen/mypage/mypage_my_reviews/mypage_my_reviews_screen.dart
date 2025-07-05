import 'package:damdiet/routes/app_routes.dart';
import 'package:damdiet/screen/mypage/mypage_my_reviews/widgets/mypage_review_list_item.dart';
import 'package:flutter/material.dart';

import '../../../models/MyReview.dart';
import '../../../models/Product.dart';
import '../../../models/Review.dart';

class MyPageMyReviewsScreen extends StatefulWidget {
  const MyPageMyReviewsScreen({super.key});

  @override
  State<MyPageMyReviewsScreen> createState() => _MyPageMyReviewsScreen();
}


class _MyPageMyReviewsScreen extends State<MyPageMyReviewsScreen> {

  int currentPage = 1;
  bool isLoading = false;
  bool hasNextPage = true;

  final List<MyReview> dummyMyReviews = [
    MyReview(
      id: '60f7b1b5e1b9c8a2d4567890',
      product: Product(
        id: '60f7b1b5e1b9c8a2d4567891',
        name: '스마트 워치',
        image: 'https://example.com/product.jpg', price: null, isFavorite: null,
      ),
      rating: 5,
      content: '배송도 빠르고 품질도 기대 이상이었습니다. 추천합니다. ',
      images: [
        "https://image6.coupangcdn.com/image/retail/images/2882595627829337-dda8fe4b-040f-4d3a-9fc2-fa00a275ecf3.jpg",
        'https://example.com/review1.jpg',
      ],
      createdAt: DateTime.parse('2025-06-20T15:30:00.000Z'),
      updatedAt: DateTime.parse('2025-06-21T10:15:00.000Z'),
    ),
    MyReview(
      id: '60f7b1b5e1b9c8a2d4567892',
      product: Product(
        id: '60f7b1b5e1b9c8a2d4567893',
        name: '무선 이어폰',
        image: 'https://example.com/product2.jpg',price: null, isFavorite: null,
      ),
      rating: 4,
      content: '음질이 깔끔하고 사용하기 편리합니다.',
      images: [
        'https://example.com/review3.jpg',
      ],
      createdAt: DateTime.parse('2025-06-22T11:20:00.000Z'),
      updatedAt: DateTime.parse('2025-06-23T09:10:00.000Z'),
    ),
    MyReview(
      id: '60f7b1b5e1b9c8a2d4567894',
      product: Product(
        id: '60f7b1b5e1b9c8a2d4567895',
        name: '게이밍 마우스',
        image: 'https://example.com/product3.jpg',price: null, isFavorite: null,
      ),
      rating: 5,
      content: '반응 속도가 빨라서 게임할 때 좋아요.',
      images: [],
      createdAt: DateTime.parse('2025-06-24T14:00:00.000Z'),
      updatedAt: DateTime.parse('2025-06-25T12:45:00.000Z'),
    ),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
      appBar: AppBar(title: const Text('리뷰')),
      body: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        itemCount: dummyMyReviews.length,
        itemBuilder: (context, index) {
            return MypageReviewListItem(
              myReview: dummyMyReviews[index],
              onTapEdit: () {  },
              onTapDelete: () {  },
            );
        },
      ),
    );
  }
}


