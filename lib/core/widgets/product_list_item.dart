import 'package:damdiet/core/theme/appcolor.dart';
import 'package:damdiet/data/models/product/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProductListItem extends StatelessWidget {
  const ProductListItem({
    super.key, required this.product, required this.onTap,
  });

  final Product product;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    int discountedPrice = product.price;
    if (product.discount != 0) {
      discountedPrice = (product.price * (100 - product.discount) / 100).toInt();
    }

    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              product.image,
              width: 100,
              height: 100,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return SizedBox(
                  width: 100,
                  height: 100,
                  child: Center(child: CircularProgressIndicator()),
                );
              },
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

                      Visibility(
                        visible: product.rating == 0.0,
                        child: IconButton(
                          iconSize: 10,
                          padding: EdgeInsets.zero,
                          visualDensity: VisualDensity(
                            vertical: -4,
                            horizontal: -2,
                          ),
                          onPressed: () {},
                          icon: SvgPicture.asset('assets/icons/ic_cancel.svg'),
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
                            Text(
                              "$product.rating",
                              style: TextStyle(
                                fontSize: 12,
                                fontFamily: 'PretendardRegular',
                                color: AppColors.textMain,
                                decoration: TextDecoration.underline,
                                decorationColor: AppColors.highlightYellowDark,
                              ),
                            ),
                          ],
                        ),
                      ),

                      Visibility(
                        visible: product.discount != 0,
                        child: Text(
                          "${product.price} 원",
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
                            "$discountedPrice 원",
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

            /*SizedBox(
              height: 100,
              child: ,
            ),*/
          ],
        ),
      ),
    );
  }
}
