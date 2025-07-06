import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/theme/appcolor.dart';

class ProductQuantitySelector extends StatelessWidget {
  const ProductQuantitySelector({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
              left: 16.0,
              top:16.0
          ),
          child: const Text(
            "상품 수량",
            style: TextStyle(
              fontFamily: 'PretendardSemiBold',
              fontSize: 14,
              color: AppColors.textMain,
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //TODO 머지 후 cart 쪽에서 작업한 것으로 대체
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "- 0 +",
                style: TextStyle(
                  fontFamily: 'PretendardSemiBold',
                  fontSize: 14,
                  color: AppColors.textMain,
                ),
              ),
            ),
            Row(
              children: [
                Text(
                  "6,300 원",
                  style: TextStyle(
                    fontFamily: 'PretendardMedium',
                    fontSize: 14,
                    color: AppColors.textMain,
                  ),
                ),
                const SizedBox(width: 4),
                IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(
                    'assets/icons/ic_cancel.svg',
                    width: 16,
                    height: 16,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
