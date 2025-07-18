import 'package:flutter/material.dart';

import '../../../../../core/theme/appcolor.dart';

class FavoriteEmptyView extends StatelessWidget {
  const FavoriteEmptyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/empty_image.png',width: 100,height: 100,),
          SizedBox(height: 16),
          Text('찜한 상품이 없어요!', style: TextStyle(fontSize: 14, fontFamily: 'PretendardSemiBold', color: AppColors.textMain)),
          SizedBox(height: 8),
          Text('마음에 드는 상품을\n찜해보세요!',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, color: AppColors.textSub, height: 1.5, fontFamily: 'PretendardSemiBold')),
        ],
      ),
    );
  }
}
