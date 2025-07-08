import 'package:damdiet/core/utils/formatters.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/theme/appcolor.dart';
import '../../cart/widgets/cart_quantity_control.dart';

class ProductQuantitySelector extends StatelessWidget {

  final int quantity;
  final int totalPrice;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;
  final VoidCallback onCancel;

  const ProductQuantitySelector({super.key, required this.quantity, required this.totalPrice, required this.onIncrement, required this.onDecrement, required this.onCancel});

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
              child: CartQuantityControl(quantity: quantity, onIncrement: onIncrement, onDecrement: onDecrement,),
            )
            ,
            Row(
              children: [
                Text(
                  formatPrice(totalPrice),
                  style: TextStyle(
                    fontFamily: 'PretendardMedium',
                    fontSize: 14,
                    color: AppColors.textMain,
                  ),
                ),
                const SizedBox(width: 4),
                IconButton(
                  onPressed: onCancel,
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
