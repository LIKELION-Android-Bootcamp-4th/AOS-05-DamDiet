import 'package:flutter/material.dart';
import 'package:damdiet/core/theme/appcolor.dart';
import 'package:damdiet/presentation/screens/mypage/mypage_my_order_detail/widgets/order_item.dart';
import 'package:damdiet/presentation/screens/mypage/mypage_my_order_detail/widgets/mypage_order_product_item_row.dart';

class MyPageOrderProductListSection extends StatelessWidget {
  final List<OrderItem> items;

  const MyPageOrderProductListSection({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: items.length,
        itemBuilder: (context, index) {
          return MyPageOrderProductItemRow(item: items[index]);
        },
        separatorBuilder: (context, index) =>
        const Column(
          children: [
            SizedBox(height: 12),
            Divider(height: 1, color: AppColors.gray100),
            SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}