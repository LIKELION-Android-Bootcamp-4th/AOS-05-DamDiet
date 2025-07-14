import 'package:flutter/material.dart';

import '../../../../core/theme/appcolor.dart';

class CartQuantityControl extends StatelessWidget {
  final int quantity;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  const CartQuantityControl({
    super.key,
    required this.quantity,
    required this.onIncrement,
    required this.onDecrement,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 24,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.gray100),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: onDecrement,
            borderRadius: BorderRadius.circular(10),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: const Icon(Icons.remove, size: 16, color: AppColors.textSub),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: Text(
              '$quantity',
              style: const TextStyle(
                fontSize: 12,
                color: AppColors.textMain,
                fontFamily: 'PretendardMedium',
              ),
            ),
          ),
          InkWell(
            onTap: onIncrement,
            borderRadius: BorderRadius.circular(10),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: const Icon(Icons.add, size: 16, color: AppColors.textSub),
            ),
          ),
        ],
      ),
    );
  }

}
