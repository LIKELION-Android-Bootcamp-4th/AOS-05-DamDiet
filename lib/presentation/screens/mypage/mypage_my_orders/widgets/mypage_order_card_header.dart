import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:damdiet/core/theme/appcolor.dart';
import 'package:damdiet/presentation/routes/app_routes.dart';

class MyPageOrderCardHeader extends StatelessWidget {
  final String orderDate;

  const MyPageOrderCardHeader({super.key, required this.orderDate});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(orderDate, style: const TextStyle(fontSize: 12,color: AppColors.textMain, fontFamily: 'PretendardSemiBold')),
        TextButton(
          onPressed: () { Navigator.pushNamed(context, AppRoutes.myOrderDetail); },
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