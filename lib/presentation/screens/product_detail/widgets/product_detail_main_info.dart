import 'package:flutter/material.dart';

import '../../../../core/theme/appcolor.dart';
import '../../../../core/widgets/underline_text.dart';

class ProductDetailMainInfo extends StatelessWidget {
  const ProductDetailMainInfo({super.key});

  @override
  Widget build(BuildContext context) {
    //TODO 할인 있을때 공간 유지용
    final hasDiscount = true;
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          UnderlineText(
            text: "담다잇 닭가슴살",
            textStyle: TextStyle(
              fontFamily: 'PretendardSemiBold',
              fontSize: 20,
              color: AppColors.textMain,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              hasDiscount
                  ? Text(
                '10,000원',
                style: TextStyle(
                    color: AppColors.textHint,
                    decoration: TextDecoration.lineThrough,
                    fontSize: 16,
                    fontFamily: "PretendardMedium"
                ),
              )
                  : SizedBox(
                height: 16, // 원가 글자 폭과 맞게 고정
              ),
            ],
          ),
          // 별점과 리뷰 수
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Icons.star, color: Colors.amber, size: 20),
                  const SizedBox(width: 2),
                  Text('3.7',
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'PretendardRegular',
                      )),
                  const SizedBox(width: 4),
                  Text('(24)',
                    style: TextStyle(
                      color: AppColors.textHint,
                      fontSize: 12,
                      fontFamily: 'PretendardRegular',
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    '30%',
                    style: TextStyle(
                      color: AppColors.errorRed,
                      fontSize: 20,
                      fontFamily: 'PretendardBold',
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    '7,000원',
                    style: const TextStyle(
                      fontFamily: 'PretendardBold',
                      fontSize: 20,
                      color: AppColors.textMain,
                    ),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
