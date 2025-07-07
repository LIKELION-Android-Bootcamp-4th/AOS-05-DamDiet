import 'package:flutter/material.dart';

import '../../../../core/theme/appcolor.dart';
import '../../../../data/models/product/product_nutrition.dart';

class ProductDetailInfo extends StatelessWidget {
  final ProductNutrition productNutrition;

  const ProductDetailInfo({super.key, required this.productNutrition});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '영양정보(1개당)',
              style: TextStyle(
                fontSize: 14,
                fontFamily: 'PretendardRegular',
                color: AppColors.textHint,
              ),
            ),
            const SizedBox(height: 12),
            _buildRow('총 칼로리', productNutrition.calories),
            const SizedBox(height: 12),
            _buildRow('탄수화물', productNutrition.carbs),
            const SizedBox(height: 12),
            _buildRow('단백질', productNutrition.protein),
            const SizedBox(height: 12),
            _buildRow('지방', productNutrition.fat),
          ],
        ),
    );
  }

  Widget _buildRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            fontFamily: 'PretendardRegular',
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            color: AppColors.textHint,
            fontSize: 14,
            fontFamily: 'PretendardRegular',
          ),
        ),
      ],
    );
  }
}
