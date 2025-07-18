import 'package:flutter/material.dart';

import '../theme/appcolor.dart';


class ConfirmDialog extends StatelessWidget {
  final String title;
  final String content;
  final VoidCallback onCancel;
  final VoidCallback onConfirm;

  const ConfirmDialog({
    super.key,
    required this.title,
    required this.content,
    required this.onCancel,
    required this.onConfirm,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontFamily: 'PretendardRegular',
                  color: AppColors.textMain
              ),
            ),
            const SizedBox(height: 4),
            Text(
              content,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontFamily: 'PretendardRegular',
                fontSize: 14,
                color: AppColors.textSub
              ),
            ),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: onCancel, // 선택 삭제
                  child: const Text(
                    '취소',
                    style: TextStyle(
                      fontFamily: 'PretendardSemiBold',
                      fontSize: 12,
                      color: AppColors.errorRed,
                    ),
                  ),
                ),
                SizedBox(width: 32,),
                GestureDetector(
                  onTap: onConfirm, // 선택 삭제
                  child: const Text(
                    '네',
                    style: TextStyle(
                      fontFamily: 'PretendardSemiBold',
                      fontSize: 12,
                      color: AppColors.successGreen,
                    ),
                  ),
                ),
                SizedBox(width: 16,),
              ],
            )
          ],
        ),
      ),
    );
  }
}
