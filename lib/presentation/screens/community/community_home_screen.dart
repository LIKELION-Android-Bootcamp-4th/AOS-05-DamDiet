import 'package:flutter/material.dart';

import '../../routes/app_routes.dart';

class CommunityHomeScreen extends StatelessWidget {
  const CommunityHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('This is Community Screen.'),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, AppRoutes.kcalCalculator);
            },
            child: Text("칼로리 계산기"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, AppRoutes.comWrite);
            },
            child: Text("글 작성"),
          ),
        ],
      ),
    );
  }
}
