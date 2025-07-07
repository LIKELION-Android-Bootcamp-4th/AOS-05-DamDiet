import 'package:flutter/material.dart';

import '../../../../core/theme/appcolor.dart';
import '../../../routes/app_routes.dart';

class CartOrderSummary extends StatelessWidget {
  final int selectedItemCount;
  final int totalAmount;

  const CartOrderSummary({
    super.key,
    required this.selectedItemCount,
    required this.totalAmount,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.fromLTRB(16, 16, 16, MediaQuery.of(context).padding.bottom + 12),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Text('주문금액', style: TextStyle(fontSize: 14, color: AppColors.textMain, fontFamily: 'PretendardSemiBold')),
                  const SizedBox(width: 8),
                  Text('$selectedItemCount건', style: const TextStyle(fontSize: 14, color: AppColors.textHint, fontFamily: 'PretendardMedium')),
                ],
              ),
              Text('$totalAmount원', style: const TextStyle(fontSize: 14, fontFamily: 'PretendardSemiBold', color: AppColors.textMain)),
            ],
          ),
          const SizedBox(height: 16,),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, AppRoutes.payment);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryColor,
              minimumSize: const Size(double.infinity, 50),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              elevation: 0,
            ),
            child: const Text('주문하기', style: TextStyle(fontSize: 16, fontFamily: 'PretendardSemiBold', color: Colors.white)),
          ),
        ],
      ),
    );
  }
}
