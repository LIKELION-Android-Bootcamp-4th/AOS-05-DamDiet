import 'package:damdiet/provider/nutrition_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'kcal_checked_item.dart';

class KcalCheckedList extends StatelessWidget {
  const KcalCheckedList({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<NutritionProvider>(context);

    return SizedBox(
      height: 120,
      child: ListView.builder(
        padding: EdgeInsets.zero,
        itemBuilder: (BuildContext context, int index) {
          return KcalCheckedItem(
              index: index,
              food: provider.selectedFoodList[index],
              cal: provider.selectedCalList[index].toString()
          );
        },
        itemCount: provider.selectedFoodList.length,
      ),
    );
  }
}
