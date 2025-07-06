import 'package:flutter/material.dart';
import '../../../../core/theme/appcolor.dart';

class ReviewTextField extends StatefulWidget {
  final TextEditingController controller;
  final String? initialValue;

  const ReviewTextField({
    super.key,
    required this.controller,
    this.initialValue,
  });

  @override
  State<ReviewTextField> createState() => _ReviewTextFieldState();
}

class _ReviewTextFieldState extends State<ReviewTextField> {
  @override
  void initState() {
    super.initState();
    if (widget.initialValue != null && widget.controller.text.isEmpty) {
      widget.controller.text = widget.initialValue!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      maxLines: 9,
      decoration: const InputDecoration(
        hintText: '리뷰를 작성하세요.',
        hintStyle: TextStyle(
          color: AppColors.textHint,
          fontSize: 14,
          fontFamily: 'PretendardRegular',
        ),
        contentPadding: EdgeInsets.all(16),
        filled: true,
        fillColor: AppColors.gray100,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(
            Radius.circular(5),
          ),
        ),
      ),
    );
  }
}
