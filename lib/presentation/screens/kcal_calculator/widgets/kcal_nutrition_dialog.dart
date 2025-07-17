import 'package:animations/animations.dart';
import 'package:damdiet/core/theme/appcolor.dart';
import 'package:damdiet/presentation/screens/kcal_calculator/kcal_calculator_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class KcalNutritionDialog extends StatelessWidget {
  const KcalNutritionDialog({
    super.key,
    required this.index, required this.viewModel
  });

  final int index;
  final KcalCalculatorViewmodel viewModel;


  @override
  Widget build(BuildContext context) {
    var list = viewModel.searchedFoodList[index];

    var nutDetailTextStyle = TextStyle(
      fontSize: 14,
      fontFamily: 'PretendardRegular',
      color: AppColors.textSub,
    );

    return AlertDialog(
      backgroundColor: Colors.white, // 배경색 변경
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
              '제품명: ${list.product}',
              style: TextStyle(
                fontSize: 16,
                fontFamily: 'PretendardMedium',
                color: AppColors.textMain,
              )
            ),
            SizedBox(height: 8),
            Visibility(
              visible: list.company != '',
              child: Text(
                  '제조사: ${list.company}',
                  style: nutDetailTextStyle
              ),
            ),
            SizedBox(height: 8),
            Visibility(
              visible: list.calorie != '',
              child: Text(
                '열량: ${list.calorie}kcal',
                style: nutDetailTextStyle
              ),
            ),
            Visibility(
              visible: list.protein != null && list.protein != '',
              child: Text(
                '단백질: ${list.protein}g',
                style: nutDetailTextStyle
              ),
            ),
            Visibility(
              visible: list.fat != null && list.fat != '',
              child: Text(
                  '지방: ${list.fat}g',
                  style: nutDetailTextStyle
              ),
            ),
            Visibility(
              visible: list.carbs != null && list.carbs != '',
              child: Text(
                  '탄수화물: ${list.carbs}g',
                  style: nutDetailTextStyle
              ),
            ),
            Visibility(
              visible: list.sugar != null && list.sugar != '',
              child: Text(
                  '당류: ${list.sugar}g',
                  style: nutDetailTextStyle
              ),
            ),
            Visibility(
              visible: list.sodium != null && list.sodium != '',
              child: Text(
                  '나트륨: ${list.sodium}mg',
                  style: nutDetailTextStyle
              ),
            ),

          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
            FocusScope.of(context).unfocus();
          },
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
