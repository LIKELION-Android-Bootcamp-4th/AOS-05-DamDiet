import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/theme/appcolor.dart';
import '../../cart/widgets/cart_quantity_control.dart';

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
        SizedBox(height: 8,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16, bottom: 16),
              child: CartQuantityControl(quantity: 0, onIncrement: () {  }, onDecrement: () {  },),
            )
            ,
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
