import 'package:animations/animations.dart';
import 'package:damdiet/presentation/screens/kcal_calculator/widgets/kcal_nutrition_dialog.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/theme/appcolor.dart';
import '../../../provider/nutrition_provider.dart';

class KcalListviewItem extends StatelessWidget {
  const KcalListviewItem({
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
    var provider = Provider.of<NutritionProvider>(context);

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'PretendardSemiBold',
                  color: AppColors.textMain,
                ),
              ),
              // SizedBox(height: 6),
              Text(
                company,
                style: TextStyle(
                  fontSize: 12,
                  fontFamily: 'PretendardMedium',
                  color: AppColors.textSub,
                ),
              ),
              SizedBox(height: 6),
              Visibility(
                visible: calorie != null,
                maintainState: true,
                maintainSize: true,
                maintainAnimation: true,
                child: Text(
                  "${calorie}kcal",
                  style: TextStyle(
                    fontSize: 12,
                    fontFamily: 'PretendardRegular',
                    color: AppColors.textMain,
                  ),
                ),
              ),
            ],
          ),
          Column(
            children: [
              SizedBox(
                width: 50,
                height: 28,
                child: ElevatedButton(
                  onPressed: calorie == null ? null :
                      () {
                    provider.addCalorie(name, calorie!);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor,
                    foregroundColor: Colors.white,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(6)),
                    ),
                    padding: EdgeInsets.zero,
                  ),
                  child: Text(
                    '추가',
                    style: const TextStyle(
                      fontSize: 12,
                      fontFamily: "PretendardMedium",
                    ),
                  ),
                ),
              ),

              SizedBox(height: 18),
              TextButton(
                onPressed: () async {
                  return showModal(
                    context: context,
                    configuration: const FadeScaleTransitionConfiguration(
                      transitionDuration: Duration(milliseconds: 300),
                      reverseTransitionDuration: Duration(milliseconds: 150),
                    ),
                    builder: (context) {
                      return KcalNutritionDialog(
                        name: name,
                        company: company,
                        calorie: calorie,
                      );
                    },
                  );
                },
                style: TextButton.styleFrom(
                  minimumSize: Size.zero,
                  padding: EdgeInsets.zero,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                child: Text(
                  '영양상세',
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
        ],
      ),
    );
  }
}
