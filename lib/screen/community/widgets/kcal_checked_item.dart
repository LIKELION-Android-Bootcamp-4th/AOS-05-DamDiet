import 'package:damdiet/provider/nutrition_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../util/appcolor.dart';

class KcalCheckedItem extends StatelessWidget {
  const KcalCheckedItem(
      {required this.index, required this.food, required this.cal});

  final int index;
  final String food;
  final String cal;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<NutritionProvider>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '${food}: ${cal}kcal',
            style: TextStyle(
              fontSize: 14,
              fontFamily: 'PretendardRegular',
              color: AppColors.textMain,
            ),
          ),

          TextButton(
            onPressed: () {
              provider.deleteCalorie(index);
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
