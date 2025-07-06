import 'package:animations/animations.dart';
import 'package:damdiet/core/theme/appcolor.dart';
import 'package:flutter/material.dart';

class KcalNutritionDialog extends StatelessWidget {
  const KcalNutritionDialog({
    super.key,
    required this.name,
    required this.company,
    this.calorie,
  });

  final String name;
  final String company;
  final int? calorie;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Center(
        child: Text(
          '영양 상세',
          style: TextStyle(
            fontSize: 16,
            fontFamily: 'PretendardSemiBold',
            color: AppColors.textMain,
          ),
        ),
      ),
      insetPadding: EdgeInsets.all(24),
      content: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '제품명: $name',
              style: TextStyle(
                fontSize: 16,
                fontFamily: 'PretendardMedium',
                color: AppColors.textMain,
              ),
            ),
            SizedBox(height: 8),
            Text(
              '제조사: $company',
              style: TextStyle(
                fontSize: 14,
                fontFamily: 'PretendardRegular',
                color: AppColors.textSub,
              ),
            ),
            SizedBox(height: 8),
            Visibility(
              visible: calorie != null,
              child: Text(
                '열량: ${calorie}kcal',
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: 'PretendardRegular',
                  color: AppColors.textSub,
                ),
              ),
            ),
            SizedBox(height: 32),
            TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                minimumSize: Size.zero,
                padding: EdgeInsets.zero,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              child: Text(
                '사이트로 이동',
                style: TextStyle(
                  fontSize: 12,
                  fontFamily: 'PretendardRegular',
                  color: AppColors.textMain,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: Navigator.of(context).pop,
          child: Text(
            '닫기',
            style: TextStyle(
              fontSize: 16,
              fontFamily: 'PretendardRegular',
              color: AppColors.errorRed,
            ),
          ),
        ),
      ],
    );
  }
}
