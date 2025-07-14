import 'package:damdiet/core/theme/appcolor.dart';
import 'package:damdiet/presentation/screens/payment/payment_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PaymentCheckboxWidget extends StatefulWidget {
  const PaymentCheckboxWidget({super.key});

  @override
  State<PaymentCheckboxWidget> createState() => _PaymentCheckboxWidgetState();
}

class _PaymentCheckboxWidgetState extends State<PaymentCheckboxWidget> {

  @override
  Widget build(BuildContext context) {
    var viewModel = context.watch<PaymentViewmodel>();
    return Padding(
      padding: EdgeInsets.only(left: 12.0),
      child: Row(
        children: [
          Checkbox(
            value: viewModel.isChecked,
            onChanged: (v) {
              viewModel.clickCheckbox();
            },
            activeColor: AppColors.primaryColor
          ),
          SizedBox(width: 14),
          Text(
            '모든 약관 동의',
            style: TextStyle(
              fontSize: 16,
              fontFamily: 'PretendardSemiBold',
              color: AppColors.textSub
            ),
          )
        ],
      ),
    );
  }
}
