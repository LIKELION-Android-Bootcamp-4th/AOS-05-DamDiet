import 'package:flutter/material.dart';
import '../../routes/app_routes.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('This is Product Detail Screen.'),
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
