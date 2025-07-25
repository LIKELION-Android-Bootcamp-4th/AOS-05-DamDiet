import 'package:damdiet/core/utils/formatters.dart';
import 'package:damdiet/core/widgets/network_image.dart';
import 'package:damdiet/data/models/order/my_order_item.dart';
import 'package:damdiet/presentation/screens/review/review_write_screen.dart';
import 'package:flutter/material.dart';
import 'package:damdiet/core/theme/appcolor.dart';
import 'package:damdiet/presentation/routes/app_routes.dart';

class MyPageOrderProductItemRow extends StatelessWidget {
  final OrderProduct item;
  final String orderId;

  const MyPageOrderProductItemRow({
    super.key,
    required this.item,
    required this.orderId,
  });

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            child: CommonNetworkImage(url: item.thumbnailImageUrl, size: 70)
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text.rich(
              TextSpan(
                style: const TextStyle(fontSize: 14, color: AppColors.textMain, fontFamily: 'PretendardMedium', height: 1.6),
                children: [
                  TextSpan(text: '${item.name}\n'),
                ],
              ),
            ),
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              if(item.isReviewed == false)
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(
                        context,
                        AppRoutes.reviewWrite,
                        arguments: ReviewWriteArguments(
                          product: item.toReviewSummaryProduct(),
                          orderId: orderId,
                        ),
                    );
                  },
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
                      TextSpan(text: formatPrice(item.totalPrice), style: const TextStyle(color: AppColors.textMain, fontSize: 14, fontFamily: 'PretendardMedium'),
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
}