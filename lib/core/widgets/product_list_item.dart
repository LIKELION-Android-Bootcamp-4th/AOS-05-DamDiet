import 'package:damdiet/core/theme/appcolor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProductListItem extends StatelessWidget {
  const ProductListItem({
    super.key,
    required this.name,
    required this.price,
    required this.discount,
    this.rating = 0.0,
    required this.image,
  });

  final String name;
  final int price;
  final int discount;
  final double? rating;
  final String image;

  @override
  Widget build(BuildContext context) {
    int discountedPrice = price;
    if (discount != 0) {
      discountedPrice = (price * (100 - discount) / 100).toInt();
    }

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(image, width: 100, height: 100),
          SizedBox(width: 14),

          Expanded(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      name,
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'PretendardMedium',
                        color: AppColors.textMain,
                      ),
                    ),
                    Visibility(
                      visible: rating == 0.0,
                      child: IconButton(
                        iconSize: 10,
                        padding: EdgeInsets.zero,
                        visualDensity: VisualDensity(vertical: -4, horizontal: -2),
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
                      visible: discount == 0,
                      child: SizedBox(height: 28),
                    ),
                    Visibility(
                      visible: rating == 0,
                      child: SizedBox(height: 10),
                    ),
                    Visibility(
                      visible: rating != 0.0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(
                            Icons.star,
                            size: 12,
                            color: AppColors.highlightYellowDark,
                          ),
                          Text(
                            "$rating",
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
                      visible: discount != 0,
                      child: Text(
                        "$price 원",
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
                          visible: discount != 0,
                          child: Text(
                            "$discount%",
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
    );
  }
}
