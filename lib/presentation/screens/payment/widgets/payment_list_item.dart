import 'package:damdiet/data/models/payment/payment_item.dart';
import 'package:flutter/material.dart';

import '../../../../core/theme/appcolor.dart';
import '../../../../data/models/request/order_request_dto.dart';


class PaymentListItem extends StatelessWidget {
  const PaymentListItem({
    super.key,
    required this.paymentItem
  });

  final PaymentItem paymentItem;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            paymentItem.image,
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
            errorBuilder: (context, error, stackTrace) {
              return SizedBox(
                width: 100,
                height: 100,
                child: Center(child: Icon(Icons.error)),
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
                      visible:  paymentItem.discount != 0,
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
                        Text(
                          "원",
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
    );
  }
}
