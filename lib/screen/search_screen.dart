import 'package:damdiet/routes/app_routes.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('This is Search Screen.'),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, AppRoutes.products);
            },
            child: Text("검색 결과")
          )
        ],
      ),
    );
  }
}
