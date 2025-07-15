import 'package:damdiet/core/theme/appcolor.dart';
import 'package:flutter/material.dart';

class PaymentTextField extends StatefulWidget {
  const PaymentTextField({super.key, this.flex = 1, this.hintText = "", required this.controller, this.readOnly = false});

  final int flex;
  final String hintText;
  final TextEditingController controller;
  final bool readOnly;


  @override
  State<PaymentTextField> createState() => _PaymentTextFieldState();
}

class _PaymentTextFieldState extends State<PaymentTextField> {
  @override
  Widget build(BuildContext context) {
    final Color fillColor = widget.readOnly ? AppColors.gray200 : AppColors.gray100;

    return Expanded(
      flex: widget.flex,
      child: TextField(
        controller: widget.controller,
        readOnly: widget.readOnly,
        decoration: InputDecoration(
          filled: true,
          fillColor: fillColor,
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
