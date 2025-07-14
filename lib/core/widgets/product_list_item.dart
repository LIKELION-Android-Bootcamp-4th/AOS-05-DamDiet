import 'package:damdiet/core/theme/appcolor.dart';
import 'package:damdiet/core/utils/formatters.dart';
import 'package:damdiet/core/widgets/network_image.dart';
import 'package:damdiet/core/widgets/underline_text.dart';
import 'package:damdiet/data/models/product/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProductListItem extends StatelessWidget {
  const ProductListItem({
    super.key,
    required this.product,
    required this.onTap,
  });

  final Product product;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    int discountedPrice = product.price;
    if (product.discount != 0) {
      discountedPrice = (product.price * (100 - product.discount) / 100)
          .toInt();
    }

    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CommonNetworkImage(
              url: product.image,
              size: 100,
            ),
            SizedBox(width: 14),

            Expanded(
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          product.name,
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'PretendardMedium',
                            color: AppColors.textMain,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),


                    ],
                  ),
                  SizedBox(height: 12),
                  Column(
                    // mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Visibility(
                        visible: product.discount == 0,
                        child: SizedBox(height: 28),
                      ),
                      Visibility(
                        visible: product.rating == 0,
                        child: SizedBox(height: 10),
                      ),
                      Visibility(
                        visible: product.rating != 0.0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Icon(
                              Icons.star,
                              size: 12,
                              color: AppColors.highlightYellowDark,
                            ),
                            UnderlineText(
                              text: "${product.rating}",
                              textStyle: TextStyle(
                                fontSize: 12,
                                fontFamily: 'PretendardRegular',
                                color: AppColors.textMain,
                              ),
                            ),
                          ],
                        ),
                      ),

                      Visibility(
                        visible: product.discount != 0,
                        child: Text(
                          "${formatPrice(product.price)} 원",
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'PretendardBold',
                            color: AppColors.textHint,
                            decoration: TextDecoration.lineThrough,
                            decorationColor: AppColors.textHint,
                          ),
                        ),
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Visibility(
                            visible: product.discount != 0,
                            child: Text(
                              "${product.discount}%",
                              style: TextStyle(
                                fontSize: 16,
                                fontFamily: 'PretendardBold',
                                color: AppColors.errorRed,
                              ),
                            ),
                          ),

                          SizedBox(width: 14),
                          Text(
                            "${formatPrice(discountedPrice)} 원",
                            style: TextStyle(
                              fontSize: 16,
                              fontFamily: 'PretendardBold',
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
