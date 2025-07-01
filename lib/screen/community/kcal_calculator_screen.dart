import 'package:flutter/material.dart';

class KcalCalculatorScreen extends StatefulWidget {
  const KcalCalculatorScreen({super.key});

  @override
  State<KcalCalculatorScreen> createState() => _KcalCalculatorScreenState();
}

class _KcalCalculatorScreenState extends State<KcalCalculatorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('칼로리 계산기 페이지'),
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
