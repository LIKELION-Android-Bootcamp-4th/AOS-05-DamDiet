import 'package:flutter/material.dart';
import 'package:damdiet/core/theme/appcolor.dart';
import 'package:damdiet/presentation/screens/mypage/mypage_my_orders/widgets/mypage_order_card_header.dart';
import 'package:damdiet/presentation/screens/mypage/mypage_my_orders/widgets/mypage_order_card_item.dart';
import 'package:damdiet/presentation/screens/mypage/mypage_my_orders/widgets/mypage_order_card_bottom.dart';
import '../../mypage_my_orders_screen.dart';

class MyPageOrderCard extends StatelessWidget {
  final Order order;

  const MyPageOrderCard({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12.0),
      elevation: 4,
      shadowColor: Colors.black.withOpacity(1.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyPageOrderCardHeader(orderDate: order.orderDate),
            const Divider(color: AppColors.gray100, height: 1),
            const SizedBox(height: 16),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: order.items.length,
              itemBuilder: (context, index) {
                final item = order.items[index];
                return MyPageOrderCardItem(item: item);
              },
              separatorBuilder: (context, index) {
                return const Divider(
                  color: AppColors.gray100,
                  height: 32,
                  thickness: 1,
                );
              },
            ),
            const Divider(color: AppColors.gray100, height: 1),
            const SizedBox(height: 16),
            MyPageOrderCardBottom(order: order),
          ],
        ),
      ),
    );
  }
}