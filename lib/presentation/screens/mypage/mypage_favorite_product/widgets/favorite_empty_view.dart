import 'package:flutter/material.dart';

class FavoriteEmptyView extends StatelessWidget {
  const FavoriteEmptyView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('😢', style: TextStyle(fontSize: 96)),
          SizedBox(height: 18),
          Text('찜한상품이 비어있어요'),
          SizedBox(height: 8),
          Text('관심있는 상품에 좋아요를 눌러보세요!'),
        ],
      ),
    );
  }
}
