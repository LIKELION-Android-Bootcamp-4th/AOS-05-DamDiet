import 'package:flutter/material.dart';
import 'package:damdiet/core/theme/appcolor.dart';

class MyPageOrderInfoSection extends StatelessWidget {
  final String title;
  final Widget child;

  const MyPageOrderInfoSection({super.key, required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: const TextStyle(color: AppColors.textMain, fontSize: 14, fontFamily: 'PretendardSemiBold')),
        Container(
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: child,
        ),
      ],
    );
  }
}