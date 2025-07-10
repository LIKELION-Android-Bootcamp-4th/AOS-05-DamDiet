import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:damdiet/core/theme/appcolor.dart';
import 'package:damdiet/core/widgets/damdiet_appbar.dart';
import 'package:damdiet/presentation/routes/app_routes.dart';

import 'package:damdiet/presentation/screens/mypage/mypage_my_order_detail/widgets/order_item.dart';
import 'package:damdiet/presentation/screens/mypage/mypage_my_order_detail/widgets/mypage_order_product_list_section.dart';
import 'package:damdiet/presentation/screens/mypage/mypage_my_order_detail/widgets/mypage_order_info_section.dart';
import 'package:damdiet/presentation/screens/mypage/mypage_my_order_detail/widgets/mypage_order_info_row.dart';
import 'package:provider/provider.dart';

import '../../../../core/utils/extract_date.dart';
import '../../../../data/repositories/order_repository.dart';
import 'order_detail_viewmodel.dart';

class MyPageMyOrderDetailsScreenWrapper extends StatelessWidget {
  final String orderId;

  const MyPageMyOrderDetailsScreenWrapper({super.key, required this.orderId});

  @override
  Widget build(BuildContext context) {
    final repository = Provider.of<OrderRepository>(context, listen: false);

    return ChangeNotifierProvider<OrderDetailViewModel>(
      create: (_) => OrderDetailViewModel(repository)..getOrderDetail(orderId),
      child: const MyPageMyOrderDetailsScreen(),
    );
  }
}

class MyPageMyOrderDetailsScreen extends StatelessWidget {
  const MyPageMyOrderDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<OrderDetailViewModel>();
    final order = viewModel.orderDetail!;

    if (viewModel.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

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
              child: Text(extractDate(order.createdAt), style: const TextStyle(
                  color: AppColors.textMain,
                  fontSize: 12,
                  fontFamily: 'PretendardSemiBold')),
            ),
            const Divider(color: AppColors.gray100, height: 1),
            const SizedBox(height: 12),

            MyPageOrderProductListSection(items: order.products),

            const Divider(color: AppColors.gray100, height: 1),
            const SizedBox(height: 16),

            MyPageOrderInfoSection(
              title: '배송 정보',
              child: Column(
                children: [
                  MyPageOrderInfoRow(label: '수령인', value: order.shippingInfo.recipient),
                  MyPageOrderInfoRow(label: '휴대폰', value: order.shippingInfo.phone),
                  MyPageOrderInfoRow(
                      label: '주소',
                      value: order.shippingInfo.address,
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
                        Text('${order.totalAmount}원', style: const TextStyle(color: AppColors.textMain, fontSize: 14, fontFamily: 'PretendardBold')
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
                        //TODO payment 추가
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