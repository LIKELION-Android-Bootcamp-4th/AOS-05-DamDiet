import 'package:damdiet/core/utils/formatters.dart';
import 'package:damdiet/core/widgets/network_image.dart';
import 'package:flutter/material.dart';
import 'package:damdiet/core/theme/appcolor.dart';
import '../../../../../data/models/order/my_order_item.dart';

class MyPageOrderCardItem extends StatelessWidget {
  final OrderProduct item;

  const MyPageOrderCardItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommonNetworkImage(
          url: item.thumbnailImageUrl,
          size: 70,
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
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 26.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text('${item.quantity}개', style: const TextStyle(color: AppColors.textSub, fontSize: 12, fontFamily: 'PretendardMedium')),
                    const SizedBox(width: 16),
                    Text(formatPrice(item.totalPrice), style: const TextStyle(color: AppColors.textMain, fontSize: 14, fontFamily: 'PretendardMedium')),
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