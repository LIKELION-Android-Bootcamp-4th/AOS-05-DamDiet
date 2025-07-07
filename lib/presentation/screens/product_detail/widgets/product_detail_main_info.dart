import 'package:damdiet/core/utils/formatters.dart';
import 'package:flutter/material.dart';

import '../../../../core/theme/appcolor.dart';
import '../../../../core/widgets/underline_text.dart';
import '../../../../data/models/product/product.dart';

class ProductDetailMainInfo extends StatelessWidget {
  final Product product;

  const ProductDetailMainInfo({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    final hasDiscount = product.discount > 0;

    final int discountedPrice = hasDiscount
        ? (product.price * (1 - product.discount / 100)).round()
        : product.price;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          UnderlineText(
            text: product.name,
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
                formatPrice(product.price),
                style: TextStyle(
                    color: AppColors.textHint,
                    decoration: TextDecoration.lineThrough,
                    fontSize: 16,
                    fontFamily: "PretendardMedium"
                ),
              )
                  : SizedBox(
                height: 16,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Icons.star, color: Colors.amber, size: 20),
                  const SizedBox(width: 2),
                  Text('${product.rating}',
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'PretendardRegular',
                      )),
                  const SizedBox(width: 4),
                  Text('(${product.reviews?.length ?? 0})',
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
                  hasDiscount ? Text(
                    '${product.discount}%',
                    style: TextStyle(
                      color: AppColors.errorRed,
                      fontSize: 20,
                      fontFamily: 'PretendardBold',
                    ),
                  )  : const SizedBox.shrink(),
                  const SizedBox(width: 8),
                  Text(
                    formatPrice(discountedPrice),
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
