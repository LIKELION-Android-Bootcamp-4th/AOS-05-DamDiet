import 'package:flutter/material.dart';

import '../routes/app_routes.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('This is Cart Screen.'),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, AppRoutes.payment);
            },
            child: Text("결제 창 이동"),
          ),
        ],
      ),
    );
  }
}
