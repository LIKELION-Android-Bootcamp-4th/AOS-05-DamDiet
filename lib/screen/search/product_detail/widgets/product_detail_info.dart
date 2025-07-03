import 'package:flutter/material.dart';

import '../../../../util/appcolor.dart';

class ProductDetailInfo extends StatelessWidget {
  const ProductDetailInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
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
            _buildRow('총 칼로리', '220 kcal'),
            const SizedBox(height: 12),
            _buildRow('탄수화물', '50 g'),
            const SizedBox(height: 12),
            _buildRow('단백질', '12 g'),
            const SizedBox(height: 12),
            _buildRow('지방', '1.7 g'),
          ],
        ),
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
