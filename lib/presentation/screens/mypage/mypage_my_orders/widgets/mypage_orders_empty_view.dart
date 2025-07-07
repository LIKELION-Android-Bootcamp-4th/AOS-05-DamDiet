import 'package:flutter/material.dart';
import 'package:damdiet/core/theme/appcolor.dart';

class MyPageOrdersEmptyView extends StatelessWidget {
  const MyPageOrdersEmptyView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('😢', style: TextStyle(fontSize: 60)),
          SizedBox(height: 16),
          Text('아직 주문 내역이 없네요!', style: TextStyle(fontSize: 14, fontFamily: 'PretendardSemiBold', color: AppColors.textMain)),
          SizedBox(height: 8),
          Text('마음에 드는 상품을\n주문해주세요!',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, color: AppColors.textSub, height: 1.5, fontFamily: 'PretendardSemiBold')),
        ],
      ),
    );
  }
}