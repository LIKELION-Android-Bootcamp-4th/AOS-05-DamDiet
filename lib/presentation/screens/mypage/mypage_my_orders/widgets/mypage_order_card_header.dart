import 'package:damdiet/core/utils/extract_date.dart';
import 'package:damdiet/core/utils/translateOrderStatus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:damdiet/core/theme/appcolor.dart';
import 'package:damdiet/presentation/routes/app_routes.dart';

class MyPageOrderCardHeader extends StatelessWidget {
  final String orderDate;
  final String orderId;
  final String status;

  const MyPageOrderCardHeader({super.key, required this.orderDate, required this.orderId, required this.status});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Text(extractDate(orderDate), style: const TextStyle(fontSize: 12,color: AppColors.textMain, fontFamily: 'PretendardSemiBold')),
            const SizedBox(width: 8,),
            Text((translateOrderStatus(status)), style: const TextStyle(fontSize: 12,color: AppColors.errorRed, fontFamily: 'PretendardSemiBold')),
          ]
        ),
        TextButton(
          onPressed: () { Navigator.pushNamed(
            context,
            AppRoutes.myOrderDetail,
            arguments: orderId,
          ); },
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
            minimumSize: const Size(50, 30),
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            alignment: Alignment.centerRight,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('주문 상세', style: TextStyle(fontSize: 12,color: AppColors.textHint, fontFamily: 'PretendardMedium')),
              const SizedBox(width: 4),
              SvgPicture.asset(
                'assets/icons/ic_arrow_forward.svg',
                width: 12,
                height: 12,
                colorFilter: const ColorFilter.mode(
                  AppColors.textHint,
                  BlendMode.srcIn,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}