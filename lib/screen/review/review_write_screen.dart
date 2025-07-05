import 'package:flutter/material.dart';


class ReviewWriteScreen extends StatelessWidget {
  const ReviewWriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('This is Community Screen.'),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("뒤로 가기"),
          ),
        ],
      ),
    );
  }
}
