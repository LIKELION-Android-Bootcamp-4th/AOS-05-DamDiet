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
              final List<OrderItem> orderItems = [];
              final List<PaymentItem> paymentItems = [];
              final List<String> orderIds = [];
              for(int index = 0; index < viewModel.cart!.items.length; index++) {
                var orderItem = OrderItem(
                  product: viewModel.cart!.items[index].product.id,
                  quantity: viewModel.cart!.items[index].quantity,
                  unitPrice: viewModel.cart!.items[index].product.unitPrice
                );
                var paymentItem = PaymentItem(
                  name: viewModel.cart!.items[index].product.name,
                  price: viewModel.cart!.items[index].product.unitPrice,
                  discount: 0,
                  image: viewModel.cart!.items[index].product.thumbnailImage
                );
                orderItems.add(orderItem);
                paymentItems.add(paymentItem);
                orderIds.add(viewModel.cart!.items[index].id);
                debugPrint(viewModel.cart!.items[index].id);
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
