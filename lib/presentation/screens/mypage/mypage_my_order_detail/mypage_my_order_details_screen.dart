import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:damdiet/core/theme/appcolor.dart';
import 'package:damdiet/core/widgets/damdiet_appbar.dart';
import 'package:damdiet/presentation/routes/app_routes.dart';

import 'package:damdiet/presentation/screens/mypage/mypage_my_order_detail/widgets/order_item.dart';
import 'package:damdiet/presentation/screens/mypage/mypage_my_order_detail/widgets/mypage_order_product_list_section.dart';
import 'package:damdiet/presentation/screens/mypage/mypage_my_order_detail/widgets/mypage_order_info_section.dart';
import 'package:damdiet/presentation/screens/mypage/mypage_my_order_detail/widgets/mypage_order_info_row.dart';

class MyPageMyOrderDetailsScreen extends StatelessWidget {
  const MyPageMyOrderDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const String orderDate = '25.06.18';
    final List<OrderItem> items = [
      OrderItem(imageUrl: '',
          name: '담다잇 닭가슴살 블랙페퍼',
          quantity: 2,
          price: 7000,
          hasReview: false),
      OrderItem(imageUrl: '',
          name: '담다잇 닭가슴살',
          optionName: '볼케이노 맛',
          quantity: 2,
          price: 6300,
          hasReview: true),
    ];
    const int totalAmount = 19600;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: DamdietAppbar(
        title: '주문 상세',
        showBackButton: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(28.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 12.0),
              child: Text(orderDate, style: const TextStyle(
                  color: AppColors.textMain,
                  fontSize: 12,
                  fontFamily: 'PretendardSemiBold')),
            ),
            const Divider(color: AppColors.gray100, height: 1),
            const SizedBox(height: 12),

            MyPageOrderProductListSection(items: items),

            const Divider(color: AppColors.gray100, height: 1),
            const SizedBox(height: 16),

            MyPageOrderInfoSection(
              title: '배송 정보',
              child: Column(
                children: [
                  MyPageOrderInfoRow(label: '수령인', value: '김멋사'),
                  MyPageOrderInfoRow(label: '휴대폰', value: '010-1234-5678'),
                  MyPageOrderInfoRow(
                      label: '주소',
                      value: '경기도 00시 00구 00-0 000아파트\n00동 000호',
                      crossAxisAlignment: CrossAxisAlignment.start),
                ],
              ),
            ),
            const Divider(color: AppColors.gray100, height: 14),
            const SizedBox(height: 10),

            MyPageOrderInfoSection(
              title: '결제 내역',
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('상품 금액', style: TextStyle(color: AppColors.textSub, fontSize: 12, fontFamily: 'PretendardMedium')),
                        Text('${totalAmount}원', style: const TextStyle(color: AppColors.textMain, fontSize: 14, fontFamily: 'PretendardBold')
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('결제 방법', style: TextStyle(color: AppColors.textSub, fontSize: 12, fontFamily: 'PretendardMedium')),
                        const Text('토스페이', style: TextStyle(color: AppColors.textSub, fontSize: 12, fontFamily: 'PretendardMedium')),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}