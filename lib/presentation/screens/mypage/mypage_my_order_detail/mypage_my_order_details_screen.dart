import 'package:damdiet/core/utils/formatters.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:damdiet/core/theme/appcolor.dart';
import 'package:damdiet/core/widgets/damdiet_appbar.dart';
import 'package:damdiet/presentation/routes/app_routes.dart';

import 'package:damdiet/presentation/screens/mypage/mypage_my_order_detail/widgets/mypage_order_product_list_section.dart';
import 'package:damdiet/presentation/screens/mypage/mypage_my_order_detail/widgets/mypage_order_info_section.dart';
import 'package:damdiet/presentation/screens/mypage/mypage_my_order_detail/widgets/mypage_order_info_row.dart';
import 'package:provider/provider.dart';

import '../../../../core/utils/extract_date.dart';
import '../../../../core/utils/translateOrderStatus.dart';
import '../../../../data/repositories/order_repository.dart';
import 'order_detail_viewmodel.dart';

class MyPageMyOrderDetailsScreenWrapper extends StatelessWidget {
  final String orderId;

  const MyPageMyOrderDetailsScreenWrapper({super.key, required this.orderId});

  @override
  Widget build(BuildContext context) {
    final repository = Provider.of<OrderRepository>(context, listen: false);

    return ChangeNotifierProvider<OrderDetailViewModel>(
      create: (_) => OrderDetailViewModel(repository),
      builder: (context, child) {
        return MyPageMyOrderDetailsScreen(orderId: orderId,);
      },
    );
  }
}

class MyPageMyOrderDetailsScreen extends StatefulWidget {
  final String orderId;

  const MyPageMyOrderDetailsScreen({super.key, required this.orderId});

  @override
  State<MyPageMyOrderDetailsScreen> createState() => _MyPageMyOrderDetailsScreenState();
}

class _MyPageMyOrderDetailsScreenState extends State<MyPageMyOrderDetailsScreen> {


  @override
  void initState() {
    super.initState();
    Future.microtask((){
      final viewModel = context.read<OrderDetailViewModel>();
      viewModel.getOrderDetail(widget.orderId);
    });
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<OrderDetailViewModel>();

    final order = viewModel.orderDetail;
    if (order == null) {
      return const Center(child: CircularProgressIndicator());
    }
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
              child:
              Row(
                  children: [
                    Text(extractDate(order.createdAt), style: const TextStyle(fontSize: 12,color: AppColors.textMain, fontFamily: 'PretendardSemiBold')),
                    const SizedBox(width: 8,),
                    Text((translateOrderStatus(order.status)), style: const TextStyle(fontSize: 12,color: AppColors.errorRed, fontFamily: 'PretendardSemiBold')),
                  ]
              ),
            ),
            const Divider(color: AppColors.gray100, height: 1),
            const SizedBox(height: 12),

            MyPageOrderProductListSection(
              items: order.products,
              orderId: widget.orderId,
            ),

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
                        Text(formatPrice(order.subtotalAmount), style: const TextStyle(color: AppColors.textMain, fontSize: 14, fontFamily: 'PretendardBold')
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('배송비', style: TextStyle(color: AppColors.textSub, fontSize: 12, fontFamily: 'PretendardMedium')),
                        Text('+ ${formatPrice(order.shippingCost)}', style: const TextStyle(color: AppColors.textMain, fontSize: 14, fontFamily: 'PretendardBold')
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('총 결제 금액', style: TextStyle(color: AppColors.textSub, fontSize: 12, fontFamily: 'PretendardMedium')),
                        Text(formatPrice(order.totalAmount), style: const TextStyle(color: AppColors.textMain, fontSize: 14, fontFamily: 'PretendardBold')
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
                        Text(order.payment, style: TextStyle(color: AppColors.textSub, fontSize: 12, fontFamily: 'PretendardMedium')),
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