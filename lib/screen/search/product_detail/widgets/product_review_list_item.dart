import 'package:damdiet/models/Review.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../util/appcolor.dart';

class ProductReviewListItem extends StatelessWidget {
  const ProductReviewListItem({super.key, required this.review});

  final Review review;

  @override
  Widget build(BuildContext context) {
    // TODO 이 처리는 다른 딴에서 하는게 더 좋을듯 util이나
    final date = '${review.createdAt.year}.${review.createdAt.month}.${review.createdAt.day}';

    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      review.nickname,
                      style: TextStyle(
                        fontFamily: 'PretendardSemiBold',
                        fontSize: 14,
                        color: AppColors.textMain,
                      ),
                    ),
                    Text(
                      date,
                      style: TextStyle(
                        fontFamily: 'PretendardRegular',
                        fontSize: 12,
                        color: AppColors.textSub,
                      ),
                    ),
                  ],
                )
              ]),
        ],
      ),
    );
  }
}
