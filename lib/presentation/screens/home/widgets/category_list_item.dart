import 'package:damdiet/core/theme/appcolor.dart';
import 'package:flutter/material.dart';

class CategoryListItem extends StatelessWidget {
  const CategoryListItem({
    super.key,
    required this.categoryName,
    required this.imageUrl,
  });

  final String categoryName;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 74,
      height: 66,
      margin: EdgeInsets.only(right:4),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: Image.asset(
              imageUrl,
              width: 50,
              height: 40,
              fit: BoxFit.fill,
            ),
          ),

          SizedBox(height: 4),
          Text(
            categoryName,
            style: TextStyle(
              fontFamily: 'PretendardSemiBold',
              fontSize: 12,
              color: AppColors.textMain,
            ),
          ),
        ],
      ),
    );
  }
}
