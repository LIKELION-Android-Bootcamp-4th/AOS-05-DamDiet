import 'package:flutter/material.dart';
import 'package:damdiet/core/theme/appcolor.dart';

class MyPageOrderInfoRow extends StatelessWidget {
  final String label;
  final String value;
  final CrossAxisAlignment? crossAxisAlignment;

  const MyPageOrderInfoRow({
    super.key,
    required this.label,
    required this.value,
    this.crossAxisAlignment,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 70,
            child: Text(label, style: const TextStyle(color: AppColors.textSub, fontSize: 12, fontFamily: 'PretendardMedium')),
          ),
          Expanded(child: Text(value, style: const TextStyle(color: AppColors.textSub, fontSize: 12, fontFamily: 'PretendardMedium'))),
        ],
      ),
    );
  }
}