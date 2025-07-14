import 'package:damdiet/presentation/screens/kcal_calculator/kcal_calculator_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'kcal_checked_item.dart';

class KcalCheckedList extends StatelessWidget {
  const KcalCheckedList({super.key});

  @override
  Widget build(BuildContext context) {
    var viewModel = context.read<KcalCalculatorViewmodel>();

    return SizedBox(
      height: 120,
      child: ListView.builder(
        padding: EdgeInsets.zero,
        itemBuilder: (BuildContext context, int index) {
          return KcalCheckedItem(
            index: index,
            food: viewModel.selectedFoodList[index],
            cal: viewModel.selectedCalList[index][0].toString(),
            serving: viewModel.selectedCalList[index][1].toString(),
          );
        },
        itemCount: viewModel.selectedFoodList.length,
      ),
    );
  }
}
