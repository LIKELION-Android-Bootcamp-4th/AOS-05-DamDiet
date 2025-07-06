import 'package:flutter/material.dart';

import '../../../../core/theme/appcolor.dart';

class StatusMessage extends StatelessWidget {
  final String message;
  final bool isError;

  const StatusMessage({
    super.key,
    required this.message,
    required this.isError,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      message,
      style: const TextStyle(
        fontFamily: 'PretendardMedium',
        fontSize: 12,
      ).copyWith(
        color: isError ? AppColors.errorRed : AppColors.successGreen,
      ),
    );
  }
}
