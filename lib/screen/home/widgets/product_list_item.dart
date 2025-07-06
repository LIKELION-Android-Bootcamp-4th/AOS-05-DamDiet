import 'package:damdiet/util/appcolor.dart';
import 'package:flutter/material.dart';

import '../../../models/models/product/product.dart';

class ProductListItem extends StatelessWidget {
  const ProductListItem({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 150,
      margin: EdgeInsets.only(right: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: Image.asset(
              "assets/images/damdiet_logo_6.png",
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 4),
          Text(
            product.name,
            style: TextStyle(
              fontFamily: 'PretendardMedium',
              fontSize: 14,
              color: AppColors.textMain,

            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(width: 4),
              Text(
                "30%",
                style: TextStyle(fontFamily: 'PretendardBold', fontSize: 14, color: AppColors.errorRed),
              ),
              SizedBox(width: 4),
              Text(
                "${product.price}원",
                style: TextStyle(fontFamily: 'PretendardMedium', fontSize: 12, color: AppColors.textSub),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
