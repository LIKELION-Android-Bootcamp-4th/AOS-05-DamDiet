import 'package:flutter/material.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('This is Payment Screen.'),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("돌아가기"),
            ),
          ],
        ),
      ),
    );
  }
}
