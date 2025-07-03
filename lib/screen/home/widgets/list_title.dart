import 'package:flutter/material.dart';

import '../../../util/appcolor.dart';

class ListTitle extends StatelessWidget {
  const ListTitle({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 12,
        horizontal: 16,
      ),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          title,
          style: const TextStyle(
            fontFamily: 'PretendardSemiBold',
            fontSize: 14,
            color: AppColors.textMain,
          ),
        ),
      ),
    );
  }
}
