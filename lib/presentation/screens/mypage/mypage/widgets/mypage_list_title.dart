import 'package:flutter/material.dart';

import '../../../../../core/theme/appcolor.dart';

class MyPageListTile extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const MyPageListTile(this.title, this.onTap, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      visualDensity: const VisualDensity(vertical: -4),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          color: AppColors.textMain,
          fontFamily: 'PretendardSemiBold',
        ),
      ),
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(horizontal: 30.0),
    );
  }
}
