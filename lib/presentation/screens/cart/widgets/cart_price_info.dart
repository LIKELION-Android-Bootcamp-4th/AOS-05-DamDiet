import 'package:flutter/material.dart';

import '../../../../core/theme/appcolor.dart';
import '../cart_screen.dart';

class CartPriceInfo extends StatefulWidget {
  final CartItem item;

  const CartPriceInfo({super.key, required this.item});

  @override
  State<CartPriceInfo> createState() => _CartPriceInfoState();
}

class _CartPriceInfoState extends State<CartPriceInfo> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text('${widget.item.originalPrice * widget.item.quantity}원', style: const TextStyle(fontSize: 12, decoration: TextDecoration.lineThrough, color: AppColors.textHint, fontFamily: 'PretendardMedium')),
          const SizedBox(height: 1),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('${(widget.item.discountRate * 100).toInt()}%', style: const TextStyle(fontSize: 14, color: AppColors.errorRed, fontFamily: 'PretendardBold')),
              const SizedBox(width: 8),
              Text('${widget.item.subtotal}원', style: const TextStyle(fontSize: 12, color: AppColors.textMain, fontFamily: 'PretendardMedium')),
            ],
          )
        ],
      ),
    );
  }
}
