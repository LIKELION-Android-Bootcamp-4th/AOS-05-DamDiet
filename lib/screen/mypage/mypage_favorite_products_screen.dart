import 'package:flutter/material.dart';

class MyPageFavoriteProductsScreen extends StatelessWidget {
  const MyPageFavoriteProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('관심 상품 페이지'),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("뒤로 가기")
            )
          ],
        ),
      )
    );
  }
}
