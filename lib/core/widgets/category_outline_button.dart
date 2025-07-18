import 'package:damdiet/core/constants/category_constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../theme/appcolor.dart';

class CategoryOutlineButton extends StatelessWidget {
  final int index;
  final int? selectedIndex;
  final ValueChanged<int> onSelected;

  const CategoryOutlineButton({
    super.key,
    required this.index,
    required this.selectedIndex,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    final isSelected = selectedIndex == index;

    return OutlinedButton(
      style: _setButtonState(isSelected),
      onPressed: () {
        onSelected(index);
      },
      child: Text(
        appCategories[index].nameKo,
        style: TextStyle(fontSize: 14, fontFamily: 'PretendardMedium'),
      ),
    );
  }

  ButtonStyle _setButtonState(bool isSelected) {
    if (isSelected) {
      return OutlinedButton.styleFrom(
        padding: EdgeInsets.all(14.0),
        foregroundColor: AppColors.primaryColor,
        side: BorderSide(color: AppColors.primaryColor),
        textStyle: TextStyle(fontSize: 14, fontFamily: 'PretendardMedium'),
      );
    } else {
      return OutlinedButton.styleFrom(
        padding: EdgeInsets.all(14.0),
        foregroundColor: AppColors.textHint,
        side: BorderSide(color: AppColors.textHint),
        textStyle: TextStyle(fontSize: 14, fontFamily: 'PretendardMedium'),
      );
    }
  }
}



class CategoryWithDeleteOutlineButton extends StatelessWidget {
  final String label;
  final VoidCallback onDelete;

  const CategoryWithDeleteOutlineButton({
    super.key,
    required this.label,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.all(14.0),
        foregroundColor: AppColors.textHint,
        side: const BorderSide(color: AppColors.textHint),
        textStyle: const TextStyle(fontSize: 14, fontFamily: 'PretendardMedium'),
      ),
      onPressed: onDelete,
      child: Row(
        children: [
          Text(label),
          const SizedBox(width: 6),
          const Icon(Icons.close, size: 16),
        ],
      ),
    );
  }
}


