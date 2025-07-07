import 'package:flutter/material.dart';
import 'package:damdiet/core/theme/appcolor.dart';
import '../../mypage_my_orders_screen.dart';

class MyPageOrderCardItem extends StatelessWidget {
  final OrderItem item;

  const MyPageOrderCardItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          child: Container(
            width: 70,
            height: 70,
            color: AppColors.gray100,
            child: const Icon(Icons.image, color: Colors.grey),
          ),
        ),
        const SizedBox(width: 9),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(item.name, style: const TextStyle(color: AppColors.textMain, fontSize: 14, fontFamily: 'PretendardSemiBold')),
                  if (item.optionName != null)
                    Padding(
                      padding: const EdgeInsets.only(top: 4.0),
                      child: Text(item.optionName!, style: const TextStyle(color: AppColors.textSub, fontSize: 12, fontFamily: 'PretendardMedium')),
                    ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 26.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text('${item.quantity}개', style: const TextStyle(color: AppColors.textSub, fontSize: 12, fontFamily: 'PretendardMedium')),
                    const SizedBox(width: 16),
                    Text('${item.price}원', style: const TextStyle(color: AppColors.textMain, fontSize: 14, fontFamily: 'PretendardMedium')),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}