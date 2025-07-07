import 'package:damdiet/core/theme/appcolor.dart';
import 'package:flutter/material.dart';

class PaymentCheckboxWidget extends StatefulWidget {
  const PaymentCheckboxWidget({super.key});

  @override
  State<PaymentCheckboxWidget> createState() => _PaymentCheckboxWidgetState();
}

class _PaymentCheckboxWidgetState extends State<PaymentCheckboxWidget> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 12.0),
      child: Row(
        children: [
          Checkbox(
            value: _isChecked,
            onChanged: (v) {
              setState(() {
                _isChecked = !_isChecked;
              });
            }
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
