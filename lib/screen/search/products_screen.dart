import 'package:flutter/material.dart';

import '../../routes/app_routes.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('This is Products Screen.'),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, AppRoutes.productDetail);
                },
                child: Text("제품 상세")
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("뒤로 가기")
            )
          ],
        ),
      ),
    );
  }
}
