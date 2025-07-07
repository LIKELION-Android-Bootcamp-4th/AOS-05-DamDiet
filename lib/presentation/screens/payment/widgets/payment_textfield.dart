import 'package:damdiet/core/theme/appcolor.dart';
import 'package:flutter/material.dart';

class PaymentTextField extends StatefulWidget {
  const PaymentTextField({super.key, this.flex = 1, this.hintText = ""});

  final int flex;
  final String hintText;

  @override
  State<PaymentTextField> createState() => _PaymentTextFieldState();
}

class _PaymentTextFieldState extends State<PaymentTextField> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: widget.flex,
      child: TextField(
        decoration: InputDecoration(
          filled: true,
          fillColor: AppColors.gray100,
          border: InputBorder.none,
          hintText: widget.hintText,
          hintStyle: TextStyle(
            fontSize: 14,
            fontFamily: 'PretendardRegular',
            color: AppColors.textHint
          )
        ),
      )
    );
  }
}
