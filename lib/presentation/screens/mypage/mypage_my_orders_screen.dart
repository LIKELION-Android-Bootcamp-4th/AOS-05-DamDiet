import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../routes/app_routes.dart';
import '../../../core/theme/appcolor.dart';

class OrderItem {
  final String imageUrl;
  final String name;
  final String? optionName;
  final int quantity;
  final int price;
  OrderItem({required this.imageUrl, required this.name, this.optionName, required this.quantity, required this.price});
}

class Order {
  final String orderDate;
  final List<OrderItem> items;
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
        OrderItem(imageUrl: '', name: '담다잇 닭가슴살 블랙페퍼', quantity: 1, price: 7000),
        OrderItem(imageUrl: '', name: '담다잇 닭가슴살', optionName: '볼케이노 맛', quantity: 2, price: 6300),
      ],
      totalAmount: 19600,
    ),
    Order(
      orderDate: '25.06.18',
      items: [
        OrderItem(imageUrl: '', name: '담다잇 닭가슴살 블랙페퍼', quantity: 1, price: 7000),
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
      body: _orders.isEmpty ? _buildEmptyView() : _buildOrderListView(),
    );
  }

  Widget _buildEmptyView() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('😢', style: TextStyle(fontSize: 60)),
          SizedBox(height: 16),
          Text('아직 주문 내역이 없네요!', style: TextStyle(fontSize: 14, fontFamily: 'PretendardSemiBold', color: AppColors.textMain)),
          SizedBox(height: 8),
          Text('마음에 드는 상품을\n주문해주세요!',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, color: AppColors.textSub, height: 1.5, fontFamily: 'PretendardSemiBold')),
        ],
      ),
    );
  }

  Widget _buildOrderListView() {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: _orders.length,
      itemBuilder: (context, index) {
        return _buildOrderCard(_orders[index]);
      },
    );
  }

  Widget _buildOrderCard(Order order) {
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
            _buildCardHeader(order.orderDate),
            const Divider(color: AppColors.gray100, height: 1),
            const SizedBox(height: 16),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: order.items.length,
              itemBuilder: (context, index) {
                final item = order.items[index];
                return _buildOrderItem(item);
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
            _buildCardBottom(order),
          ],
        ),
      ),
    );
  }

  Widget _buildCardHeader(String date){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(date, style: const TextStyle(fontSize: 12,color: AppColors.textMain, fontFamily: 'PretendardSemiBold')),
        TextButton(
          onPressed: () { Navigator.pushNamed(context, AppRoutes.myOrderDetail); },
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
            minimumSize: const Size(50, 30),
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            alignment: Alignment.centerRight,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('주문 상세', style: TextStyle(fontSize: 12,color: AppColors.textHint, fontFamily: 'PretendardMedium')),
              SizedBox(width: 4),
              SvgPicture.asset(
                'assets/icons/ic_arrow_forward.svg',
                width: 12,
                height: 12,
                colorFilter: const ColorFilter.mode(
                  AppColors.textHint,
                  BlendMode.srcIn,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildOrderItem(OrderItem item) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          child: Container(
            width: 70,
            height: 70,
            color: AppColors.gray100,
            child: const Icon(Icons.image, color: Colors.grey),
          ),
        ),
        const SizedBox(width: 9),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(item.name, style: const TextStyle(color: AppColors.textMain, fontSize: 14, fontFamily: 'PretendardSemiBold')),
                  if (item.optionName != null)
                    Padding(
                      padding: const EdgeInsets.only(top: 4.0),
                      child: Text(item.optionName!, style: const TextStyle(color: AppColors.textSub, fontSize: 12, fontFamily: 'PretendardMedium')),
                    ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 26.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text('${item.quantity}개', style: const TextStyle(color: AppColors.textSub, fontSize: 12, fontFamily: 'PretendardMedium')),
                    const SizedBox(width: 16),
                    Text('${item.price}원', style: const TextStyle(color: AppColors.textMain, fontSize: 14, fontFamily: 'PretendardMedium')),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCardBottom(Order order) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const Text('주문금액', style: TextStyle(color: AppColors.textMain, fontSize: 14, fontFamily: 'PretendardSemiBold')),
            const SizedBox(width: 18),
            Text('${order.items.length}건', style: const TextStyle(color: AppColors.textHint, fontSize: 14, fontFamily: 'PretendardMedium')),
          ],
        ),
        Text(
          '${order.totalAmount}원',
          style: const TextStyle(color: AppColors.textMain, fontSize: 14, fontFamily: 'PretendardBold'),
        ),
      ],
    );
  }
}
