import 'package:damdiet/core/utils/formatters.dart';
import 'package:damdiet/data/models/cart/cart_item.dart';
import 'package:flutter/material.dart';
import '../../../../core/theme/appcolor.dart';

class CartPriceInfo extends StatelessWidget {
  final CartItem item;

  const CartPriceInfo({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final originalTotalPrice = item.product.unitPrice * item.quantity;
    final bool hasDiscount = originalTotalPrice != item.totalPrice;

    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          if (hasDiscount)
            Text(
              formatPrice(originalTotalPrice),
              style: const TextStyle(
                fontSize: 12,
                decoration: TextDecoration.lineThrough,
                color: AppColors.textHint,
                fontFamily: 'PretendardMedium',
              ),
            ),

          const SizedBox(height: 4),

          Text(
            formatPrice(item.totalPrice),
            style: const TextStyle(
              fontSize: 14,
              color: AppColors.textMain,
              fontFamily: 'PretendardBold',
            ),
          ),
        ],
      ),
    );
  }
}
