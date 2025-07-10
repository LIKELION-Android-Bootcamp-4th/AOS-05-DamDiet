import 'package:damdiet/core/widgets/damdiet_appbar.dart';
import 'package:flutter/material.dart';
import 'package:damdiet/core/theme/appcolor.dart';

import 'package:damdiet/presentation/screens/mypage/mypage_my_orders/widgets/mypage_orders_empty_view.dart';
import 'package:damdiet/presentation/screens/mypage/mypage_my_orders/widgets/mypage_order_card.dart';
import 'package:provider/provider.dart';

import '../../../../data/models/order/my_order_item.dart';
import '../../../../data/repositories/order_repository.dart';
import 'order_viewmodel.dart';


class MyPageMyOrdersScreenWrapper extends StatelessWidget {
  const MyPageMyOrdersScreenWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final repository = Provider.of<OrderRepository>(context, listen: false);

    return ChangeNotifierProvider<OrderViewModel>(
      create: (_) => OrderViewModel(repository),
      builder: (context, child) {
        return const MyPageMyOrdersScreen();
      },
    );
  }
}

class MyPageMyOrdersScreen extends StatefulWidget {
  const MyPageMyOrdersScreen({super.key});

  @override
  State<MyPageMyOrdersScreen> createState() => _MyPageMyOrdersScreenState();
}

class _MyPageMyOrdersScreenState extends State<MyPageMyOrdersScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask((){
      context.read<OrderViewModel>().getOrders();
    });
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<OrderViewModel>();

    return Scaffold(
      backgroundColor: AppColors.gray100,
      appBar: DamdietAppbar(title: '주문 목록'),
      body: viewModel.isLoading
          ? const Center(child: CircularProgressIndicator())
          : viewModel.orders.isEmpty
          ? const MyPageOrdersEmptyView()
          : _buildOrderListView(viewModel.orders),
    );
  }

  Widget _buildOrderListView(List<MyOrderItem> orders) {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: orders.length,
      itemBuilder: (context, index) {
        return MyPageOrderCard(order: orders[index]);
      },
    );
  }
}
