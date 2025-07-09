import 'package:damdiet/presentation/screens/kcal_calculator/kcal_calculator_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/theme/appcolor.dart';
import '../../../provider/nutrition_provider.dart';

class KcalCheckedItem extends StatelessWidget {
  const KcalCheckedItem(
      {required this.index, required this.food, required this.cal, required this.serving});

  final int index;
  final String food;
  final String cal;
  final String serving;

  @override
  Widget build(BuildContext context) {
    var viewModel = context.read<KcalCalculatorViewmodel>();
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '$food: ${cal}kcal * $serving',
            style: TextStyle(
              fontSize: 14,
              fontFamily: 'PretendardRegular',
              color: AppColors.textMain,
            ),
          ),

          TextButton(
            onPressed: () {
              viewModel.deleteCalorie(index);
            },
            style: TextButton.styleFrom(
                minimumSize: Size.zero,
                padding: EdgeInsets.zero,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap
            ),
            child: Text(
              '제거',
              style: TextStyle(
                  fontSize: 14,
                  fontFamily: 'PretendardRegular',
                  color: AppColors.textMain,
                  decoration: TextDecoration.underline
              ),
            ),
          ),
        ],
      )
    );
  }
}
