import 'package:flutter/material.dart';
import 'package:damdiet/core/theme/appcolor.dart';
import '../../../../../data/models/order/my_order_item.dart';

class MyPageOrderCardBottom extends StatelessWidget {
  final MyOrderItem order;

  const MyPageOrderCardBottom({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const Text('주문금액', style: TextStyle(color: AppColors.textMain, fontSize: 14, fontFamily: 'PretendardSemiBold')),
            const SizedBox(width: 18),
            Text('${order.products.length}건', style: const TextStyle(color: AppColors.textHint, fontSize: 14, fontFamily: 'PretendardMedium')),
          ],
        ),
        Text(
          '${order.totalAmount}원',
          style: const TextStyle(color: AppColors.textMain, fontSize: 14, fontFamily: 'PretendardBold'),
        ),
      ],
    );
  }
}