import 'package:damdiet/core/theme/appcolor.dart';
import 'package:flutter/material.dart';

class PaymentTextField extends StatefulWidget {
  const PaymentTextField({super.key, this.flex = 1, this.hintText = "", required this.controller});

  final int flex;
  final String hintText;
  final TextEditingController controller;

  @override
  State<PaymentTextField> createState() => _PaymentTextFieldState();
}

class _PaymentTextFieldState extends State<PaymentTextField> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: widget.flex,
      child: TextField(
        controller: widget.controller,
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
