import 'package:damdiet/core/widgets/network_image.dart';
import 'package:damdiet/data/models/payment/payment_item.dart';
import 'package:flutter/material.dart';

import '../../../../core/theme/appcolor.dart';
import '../../../../data/models/request/order_request_dto.dart';


class PaymentListItem extends StatelessWidget {
  const PaymentListItem({
    super.key,
    required this.paymentItem, required this.orderItem
  });

  final PaymentItem paymentItem;
  final OrderItem orderItem;

  @override
  Widget build(BuildContext context) {
    var discountedPrice = (paymentItem.price * (100 - paymentItem.discount) / 100).toInt();

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonNetworkImage(url: paymentItem.image, size: 100),
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
                        paymentItem.name,
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
                      visible: paymentItem.discount == 0,
                      child: SizedBox(height: 28),
                    ),
                    SizedBox(height: 10),

                    Visibility(
                      visible: paymentItem.discount != 0,
                      child: Text(
                        "${paymentItem.price} 원",
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
                          visible: paymentItem.discount != 0,
                          child: Text(
                            "${paymentItem.discount}%",
                            style: TextStyle(
                              fontSize: 16,
                              fontFamily: 'PretendardBold',
                              color: AppColors.errorRed,
                            ),
                          ),
                        ),

                        SizedBox(width: 14),
                        Row(
                          children: [
                            Text(
                              "${orderItem.quantity}개",
                              style: TextStyle(
                                fontSize: 16,
                                fontFamily: 'PretendardBold',
                                  color: AppColors.textSub
                              ),
                            ),
                            SizedBox(width: 8,),
                            Text(
                              "${discountedPrice*orderItem.quantity}원",
                              style: TextStyle(
                                fontSize: 16,
                                fontFamily: 'PretendardBold',
                                color: AppColors.textMain
                              ),
                            ),
                            ]
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
