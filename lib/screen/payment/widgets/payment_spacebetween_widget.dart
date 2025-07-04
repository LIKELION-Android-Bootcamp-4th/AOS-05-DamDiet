import 'package:flutter/material.dart';

import '../../../util/appcolor.dart';

class PaymentSpaceBetweenWidget extends StatelessWidget {
  const PaymentSpaceBetweenWidget({super.key, required this.leftText, required this.rightText});

  final String leftText;
  final String rightText;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          leftText,
          style: TextStyle(
            fontSize: 14,
            fontFamily: 'PretendardRegular',
            color: AppColors.textMain,
          ),
        ),
        Text(
          rightText,
          style: TextStyle(
            fontSize: 14,
            fontFamily: 'PretendardRegular',
            color: AppColors.textMain,
          ),
        ),
      ],
    );
  }
}
