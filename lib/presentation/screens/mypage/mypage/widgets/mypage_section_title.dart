import 'package:flutter/material.dart';
import '../../../../../core/theme/appcolor.dart';

class MyPageSectionTitle extends StatelessWidget {
  final String title;

  const MyPageSectionTitle(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 12,
          color: AppColors.textSub,
          fontFamily: 'PretendardMedium',
        ),
      ),
    );
  }
}
