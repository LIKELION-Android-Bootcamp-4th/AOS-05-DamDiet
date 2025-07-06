import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../util/appcolor.dart';
import '../../../routes/app_routes.dart';

class OrderItem {
  final String imageUrl;
  final String name;
  final String? optionName;
  final int quantity;
  final int price;
  final bool hasReview;
  OrderItem({required this.imageUrl, required this.name, this.optionName, required this.quantity, required this.price, required this.hasReview});
}

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
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: SvgPicture.asset(
              'assets/icons/ic_arrow_back.svg', width: 24, height: 24),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text('주문 상세', style: TextStyle(color: AppColors.textMain, fontSize: 18, fontFamily: 'PretendardBold')),
        centerTitle: true,
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
            SizedBox(height: 12,),
            _buildProductList(items, context),

            const Divider(color: AppColors.gray100, height: 1),
            const SizedBox(height: 16),

            _buildInfoSection(
              title: '배송 정보',
              child: Column(
                children: [
                  _buildInfoRow('수령인', '김멋사'),
                  _buildInfoRow('휴대폰', '010-1234-5678'),
                  _buildInfoRow('주소', '경기도 00시 00구 00-0 000아파트\n00동 000호',
                      crossAxisAlignment: CrossAxisAlignment.start),
                ],
              ),
            ),
            const Divider(color: AppColors.gray100, height: 14),
            const SizedBox(height: 10),

            _buildInfoSection(
              title: '결제 내역',
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('상품 금액', style: TextStyle(color: AppColors.textSub, fontSize: 12, fontFamily: 'PretendardMedium')),
                        const Text('${totalAmount}원', style: TextStyle(color: AppColors.textMain, fontSize: 14, fontFamily: 'PretendardBold')
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


  Widget _buildProductList(List<OrderItem> items, BuildContext context) {
    return Container(
      child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: items.length,
        itemBuilder: (context, index) {
          return _buildProductItemRow(items[index], context);
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


  Widget _buildProductItemRow(OrderItem item, BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            child: Container(
              width: 70, height: 70, color: AppColors.gray100,
              child: const Icon(Icons.image, color: Colors.grey, size: 30),
            ),
          ),
          const SizedBox(width: 9),
          Expanded(
            child: Text.rich(
              TextSpan(
                style: const TextStyle(fontSize: 14, color: AppColors.textMain, fontFamily: 'PretendardMedium', height: 1.6),
                children: [
                  TextSpan(text: '${item.name}\n'),
                  if (item.optionName != null)
                    TextSpan(text: item.optionName, style: const TextStyle(fontSize: 12, color: AppColors.textSub, fontFamily: 'PretendardMedium')
                    ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              if (!item.hasReview)
                ElevatedButton(
                  onPressed: () { Navigator.pushNamed(context, AppRoutes.reviewWrite); },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                    minimumSize: Size.zero,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    elevation: 0,
                  ),
                  child: const Text('리뷰작성', style: TextStyle(fontSize: 12, fontFamily: 'PretendardMedium',)),
                ),
              const Spacer(),
              Text.rich(
                TextSpan(style: const TextStyle(color: AppColors.textHint, fontSize: 12, fontFamily: 'PretendardMedium'),
                    children: [
                      TextSpan(text: '${item.quantity}개  '),
                      TextSpan(text: '${item.price}원', style: const TextStyle(color: AppColors.textMain, fontSize: 14, fontFamily: 'PretendardMedium'),
                      ),
                    ]
                ),
                textAlign: TextAlign.right,
              ),
            ],
          )
        ],
      ),
    );
  }


  Widget _buildInfoSection({required String title, required Widget child}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: const TextStyle(color: AppColors.textMain, fontSize: 14, fontFamily: 'PretendardSemiBold')),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: child,
        ),
      ],
    );
  }


  Widget _buildInfoRow(String label, String value, {CrossAxisAlignment? crossAxisAlignment}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 70,
            child: Text(label, style: const TextStyle(color: AppColors.textSub, fontSize: 12, fontFamily: 'PretendardMedium')),
          ),
          Expanded(child: Text(value, style: const TextStyle(color: AppColors.textSub, fontSize: 12, fontFamily: 'PretendardMedium'))),
        ],
      ),
    );
  }


}