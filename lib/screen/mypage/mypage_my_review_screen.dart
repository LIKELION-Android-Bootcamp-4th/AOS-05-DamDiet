import 'package:flutter/material.dart';

class MyPageMyReviewScreen extends StatelessWidget {
  const MyPageMyReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('내 리뷰 페이지'),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("뒤로 가기"),
            ),
          ],
        ),
      ),
    );
  }
}
