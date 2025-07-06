import 'package:flutter/material.dart';

class CartEmptyView extends StatelessWidget {
  const CartEmptyView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('😢', style: TextStyle(fontSize: 96)),
          SizedBox(height: 18),
          Text('장바구니가 비어있어요'),
          SizedBox(height: 8),
          Text('상품을 담아주세요!'),
        ],
      ),
    );
  }
}
