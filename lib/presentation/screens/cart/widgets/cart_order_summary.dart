import 'package:damdiet/presentation/screens/cart/cart_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/theme/appcolor.dart';
import '../../../../data/models/payment/payment_item.dart';
import '../../../../data/models/request/order_request_dto.dart';
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
    var viewModel = context.watch<CartViewModel>();
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
              final selectedItems = viewModel.cart!.items
                  .where((item) => viewModel.selectedItemIds.contains(item.id))
                  .toList();

              final List<OrderItem> orderItems = [];
              final List<PaymentItem> paymentItems = [];
              final List<String> orderIds = [];

              for (var item in selectedItems) {
                orderItems.add(OrderItem(
                  product: item.product.id,
                  quantity: item.quantity,
                  unitPrice: item.product.unitPrice,
                ));

                paymentItems.add(PaymentItem(
                  name: item.product.name,
                  price: item.product.unitPrice,
                  discount: 0,
                  image: item.product.thumbnailImage,
                ));

                orderIds.add(item.id);
              }

              Navigator.pushNamed(
                context,
                AppRoutes.payment,
                arguments: [orderItems, paymentItems, orderIds]
              );
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
