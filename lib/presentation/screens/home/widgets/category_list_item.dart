import 'package:damdiet/core/theme/appcolor.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/category_constants.dart';

class CategoryListItem extends StatelessWidget {
  const CategoryListItem({
    super.key,
    required this.category,
    required this.onTap,
  });

  final AppCategory category;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 74,
        height: 66,
        margin: const EdgeInsets.only(right: 4),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Image.asset(
                category.imagePath,
                width: 50,
                height: 40,
                fit: BoxFit.fill,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              category.nameKo,
              style: const TextStyle(
                fontFamily: 'PretendardSemiBold',
                fontSize: 12,
                color: AppColors.textMain,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
