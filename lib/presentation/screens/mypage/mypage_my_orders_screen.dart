import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:damdiet/core/theme/appcolor.dart';

import 'package:damdiet/presentation/screens/mypage/mypage_my_orders/widgets/mypage_orders_empty_view.dart';
import 'package:damdiet/presentation/screens/mypage/mypage_my_orders/widgets/mypage_order_card.dart';

class OrderItem1 {
  final String imageUrl;
  final String name;
  final String? optionName;
  final int quantity;
  final int price;
  OrderItem1({required this.imageUrl, required this.name, this.optionName, required this.quantity, required this.price});
}

class Order {
  final String orderDate;
  final List<OrderItem1> items;
  final int totalAmount;
  Order({required this.orderDate, required this.items, required this.totalAmount});
}

class MyPageMyOrdersScreen extends StatefulWidget {
  const MyPageMyOrdersScreen({super.key});

  @override
  State<MyPageMyOrdersScreen> createState() => _MyPageMyOrdersScreenState();
}

class _MyPageMyOrdersScreenState extends State<MyPageMyOrdersScreen>{

  final List<Order> _orders = [
    Order(
      orderDate: '25.06.18',
      items: [
        OrderItem1(imageUrl: '', name: '담다잇 닭가슴살 블랙페퍼', quantity: 1, price: 7000),
        OrderItem1(imageUrl: '', name: '담다잇 닭가슴살', optionName: '볼케이노 맛', quantity: 2, price: 6300),
      ],
      totalAmount: 19600,
    ),
    Order(
      orderDate: '25.06.18',
      items: [
        OrderItem1(imageUrl: '', name: '담다잇 닭가슴살 블랙페퍼', quantity: 1, price: 7000),
      ],
      totalAmount: 7000,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.gray100,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: SvgPicture.asset(
            'assets/icons/ic_arrow_back.svg',
            width: 24,
            height: 24,
            colorFilter: const ColorFilter.mode(
              AppColors.textMain,
              BlendMode.srcIn,
            ),
          ),
        ),
        title: const Text('주문 목록', style: TextStyle(color: AppColors.textMain, fontSize: 18, fontFamily: 'PretendardBold')),
        centerTitle: true,
      ),
      body: _orders.isEmpty ? const MyPageOrdersEmptyView() : _buildOrderListView(),
    );
  }

  Widget _buildOrderListView() {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: _orders.length,
      itemBuilder: (context, index) {
        return MyPageOrderCard(order: _orders[index]);
      },
    );
  }
}