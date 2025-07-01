import 'package:damdiet/routes/app_routes.dart';
import 'package:flutter/material.dart';

class MyPageScreen extends StatelessWidget {
  const MyPageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('This is MyPage Screen.'),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, AppRoutes.profileEdit);
            },
            child: Text("내 정보 수정"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, AppRoutes.favoriteProduct);
            },
            child: Text("관심 상품"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, AppRoutes.myReview);
            },
            child: Text("나의 리뷰"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, AppRoutes.myCommunity);
            },
            child: Text("내 커뮤니티 관리"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, AppRoutes.myOrders);
            },
            child: Text("주문 목록"),
          ),
        ],
      ),
    );
  }
}
