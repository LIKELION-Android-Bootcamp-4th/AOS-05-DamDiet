import 'package:flutter/material.dart';

class MyPageMyOrdersScreen extends StatelessWidget {
  const MyPageMyOrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('주문 목록 페이지'),
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
