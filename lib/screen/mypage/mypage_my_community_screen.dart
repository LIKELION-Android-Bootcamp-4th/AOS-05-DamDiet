import 'package:flutter/material.dart';

class MyPageMyCommunityScreen extends StatelessWidget {
  const MyPageMyCommunityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('커뮤니티 관리 페이지'),
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
